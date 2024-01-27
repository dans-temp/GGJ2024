extends Marker2D
@onready var character_body_2d = $"../.."
@onready var rpg = $RPG

var just_changed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
