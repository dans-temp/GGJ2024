extends Node
var enemy_scene = preload("res://Scenes/enemy_dino.tscn")
var timer_wait = 0.3
func _ready():
	$Timer.start(timer_wait)

func _on_timer_timeout():
	# Create a new instance of the enemy scene
	var enemy_instance = enemy_scene.instantiate()
	var random_color = Color(randf(), randf(), randf(), 1.0)  # Random RGBA color


	enemy_instance.position = Vector2(4900,-2000)
	enemy_instance.modulate = random_color
	# Add the new enemy instance to the scene
	add_child(enemy_instance)
	if timer_wait < 1:
		timer_wait += 0.01
