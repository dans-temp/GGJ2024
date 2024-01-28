extends Control
@onready var cool_explosion = preload("res://Scenes/cool_explosion.tscn")
@onready var missle_animation = $missle/missle_animation
@onready var music_player1 = get_node("/root/GlobalTheme/theme")
@onready var music_player2 = get_node("/root/GlobalTheme/battle_theme")
const CROSSHAIR = preload("res://Assets/Sprites/crosshair.png")
@onready var button_pressed_sfx = $ButtonPressed

var hol_up = false
signal textbox_closed
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(null)
	$TextBox.hide()
	$ActionsPanel.hide()
	display_text('A wild enemy appears')
	await self.textbox_closed
	$ActionsPanel.show()

func _input(event):
	if (Input.is_action_just_pressed("ui_accept") || Input.is_action_just_pressed("left-click")) and $TextBox.visible and !hol_up:
		$TextBox.hide()
		emit_signal("textbox_closed")
		$ActionsPanel.hide()
		hol_up = true
		$Timer.start(0.05)
		await $Timer.timeout
		hol_up = false
		$ActionsPanel.show()

func display_text(text):
	$TextBox.show()
	$TextBox/Label.text = text
	hol_up = true
	$Timer.start(0.25)
	await $Timer.timeout
	hol_up = false
	$ActionsPanel.hide()

func _on_run_pressed():
	button_pressed_sfx.play()
	display_text("You try to run, but you can't because you remember you're not a little bitch")
	await self.textbox_closed
	hol_up = true
	$Timer.start(0.25)
	await $Timer.timeout
	hol_up = false

func _on_attack_pressed():
	if !hol_up:
		$missle.show()
		button_pressed_sfx.play()
		hol_up = true
		$ActionsPanel.hide()
		display_text("You fire a rocket propelled grenade towards the enemy")
		$launch_sfx.play()
		missle_animation.play("fly")
		$Timer.start(0.5)
		await $Timer.timeout
		$missle.hide()
		#await self.textbox_closed
		$EnemyContainer/ProgressBar.value = 0
		$EnemyDamaged.play("flashing")
		$TextBox.hide()
		var explo_instance = cool_explosion.instantiate()
		$TextBox.hide()
		explo_instance.z_index = 1
		explo_instance.global_position = get_viewport_rect().size/2
		get_parent().add_child(explo_instance)
		get_parent().add_child(explo_instance)
		$Timer.start(1)
		await $Timer.timeout
		$TextBox.hide()
		$Timer.start(1)
		await $Timer.timeout
		end_battle()


var text_count = 0
func _on_talk_pressed():
	button_pressed_sfx.play()
	if text_count == text.size():
		end_battle()
		return
	display_text(text[text_count])
	text_count = text_count + 1
	hol_up = true
	$Timer.start(0.25)
	await $Timer.timeout
	hol_up = false
	
	
func end_battle():
	GlobalVars.turn_battle_complete += 1
	GlobalVars.disable_fire = false
	music_player2.stop()
	music_player1.play()
	Input.set_custom_mouse_cursor(CROSSHAIR, Input.CURSOR_ARROW, Vector2(32,32))
	get_tree().change_scene_to_file("res://Scenes/level1.tscn")


var text = [
	"Yoyoyo what's up my brother! I got a great idea for a sick app.",
	"Ok [pulse]GET[/pulse] this!  It's an NFT but it uses AI.",
	"Thing is... I don't know anything about programming, but you think you could build it for me?",
	"I can't really pay you right now though, but think of the exposure you would get.",
	"To the [shake]moon[/shake] bro! Think of the lambos.",
	"Anyways I gotta dip, time to RISE AND GRIND! You know how it is.  Gotta get the bread.",
	"Nothing makes me more fulfilled than increasing value for the shareholders and making sure my sales manager can afford another boat",
	"It's just like I've always said life is about 2 things:  cold showers and cold calls.",
	"BIG things are just around the corner for me.",
	"I can feel it",
	"[shake]RING RING RING[/shake]",
	"[shake]RING RING RING[/shake]",
	"Yo hang on a sec breh, mind if I take this? My phones poppin' off today",
	"Yo sup Kev Dog! Your boy doing good real good",
	"I was just saying, big things are coming up",
	"yeah?",
	"nah the divorce is [tornado]nothing[/tornado] man",
	"I guess I'll miss the kids but you know what they say.  Win some you lose some.",
	"Anyways my guy I gotta take off, I've got a live one on the hook.",
	"Catch you on the flippyity flip Kev Dingo",
	"[shake]CLICK",
	"Hey sorry about that, didn't mean to leave you hangin'",
	"OHHH CRAP LOOK AT THE TIME",
	"I gotta jet, but if you ever want to invest in my crypto day trading, it's totally safe and you can expect 10x returns",
	"Here's my number king... chow lil'bro",
	"*THE ENEMY HAS FLED BATTLE*"
	]


