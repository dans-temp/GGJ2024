extends ColorRect

@export var dialogPath = "res://Assets/dialog.json"
@export var textSpeed = 0.04
var dialog


@onready var transition_sprite = $"../transition_sprite"
var phraseNum = 0
var finished = false


func _ready():
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Dialog not found")
	nextPhrase()
	
func _process(_delta):
	$Indicator.visible = finished
	# add more here to click though
	
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("left-click"):
		if finished:
			nextPhrase()
		else:
			$Text.visible_characters = len($Text.text)
	
func getDialog():
	var file = FileAccess.open(dialogPath, FileAccess.READ)
	var content = file.get_as_text()
	var json = JSON.new()
	var output = json.parse_string(content)
	return output[GlobalVars.scenario]


		

func nextPhrase() -> void:
	if phraseNum >= len(dialog):
		queue_free()
		set_game_paused(false)
		return

	set_game_paused(true)
	finished = false
	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["Text"]
	
	$Text.visible_characters = 0
	
	var portrait_path = "res://Assets/Portraits/"
	var image = portrait_path + dialog[phraseNum]["image"] + ".png"
	$Portrait.texture = load(image)
	
	var raw_text = strip_bbcode($Text.text)
	while $Text.visible_characters < len(raw_text):
		$Speech.pitch_scale = 1
		$Text.visible_characters += 1
		$Speech.pitch_scale += randf_range(-0.2, 0.2)
		if raw_text[$Text.visible_characters-1] in ["A", "a", "E", "e", "I", "i", "O", "o", "U", "u"]:
			$Speech.pitch_scale += 0.5
		$Speech.play()
		$Timer.start()
		await $Timer.timeout
	
	finished = true
	phraseNum += 1
	return

func set_game_paused(paused):
	# Pause or resume game logic, input processing, physics, etc.
	if paused:
		# Pause game logic, input processing, physics, etc.
		get_tree().paused = true
		# Optionally, stop animations or other ongoing processes
	else:
		# Resume game logic, input processing, physics, etc.
		get_tree().paused = false
		# Optionally, resume animations or other processe
		
# used to get true length
func strip_bbcode(source:String) -> String:
	var regex = RegEx.new()
	regex.compile("\\[.+?\\]")
	return regex.sub(source, "", true)
