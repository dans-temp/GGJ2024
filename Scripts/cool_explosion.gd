extends Node2D

#@onready var camera_2d_path = $SceneObjects/CharacterBody2D/Camera2D
@onready var point_light_2d = $PointLight2D

func _ready():
	$Dust.one_shot = true
	$Debris.one_shot = true
	$Sparks.play("Sparks")
	$AudioStreamPlayer2D.play()
	# Shake the screen when the bullet explodes
	GlobalVars.shake_camera.emit()
	#var camera_2d = get_node_or_null(camera_2d_path)
	#if camera_2d:
			#camera_2d.start_shake(10.0, 0.006)
	#else:
		#print("Error: Camera2D not found.")


