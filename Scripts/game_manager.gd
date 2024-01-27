extends Node2D
@onready var label = %Label
@onready var cool_explosion = preload("res://Scenes/cool_explosion.tscn")
@onready var camera_2d = $"../SceneObjects/CharacterBody2D/Camera2D"
@onready var bullet = preload("res://Scenes/bullet.tscn")
@onready var character_body_2d = $"../SceneObjects/CharacterBody2D"
@onready var gun_tip = $"../SceneObjects/CharacterBody2D/CharacterContainer/Sprite2D/Marker2D/GunTip"


var bullet_counter = 0  # Counter to keep track of bullet names
const BULLET_SPEED = 15


var points = 0

func add_point():
	points += 1
	label.text = "Points: " + str(points)

func _input(event):
	# on left click fire RPG
	if event is InputEventMouseButton and Input.is_action_just_pressed("left-click"):
		character_body_2d.play_gunshot_animation()
		var bullet_instance = bullet.instantiate()
		bullet_instance.z_index = 1
		
		var direction = (get_global_mouse_position() - gun_tip.global_position).normalized()
		bullet_instance.set_velocity(direction * BULLET_SPEED)
		# Set the bullet's initial position outside the player's hitbox
		bullet_instance.global_position = gun_tip.global_position + direction * 30
		# Create a new bullet
		bullet_instance.name = "Bullet_" + str(bullet_counter)  # Set a unique name
		bullet_counter += 1
		bullet_instance.look_at(get_global_mouse_position())
		add_child(bullet_instance)
		


