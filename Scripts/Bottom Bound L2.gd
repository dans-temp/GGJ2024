extends Area2D

@onready var character_body_2d = $"../../SceneObjects/CharacterBody2D"



func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		get_tree().change_scene_to_file("res://Scenes/level2.tscn")
		character_body_2d.position = GlobalVars.player_return_position
