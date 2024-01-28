extends Area2D

@export var target_level : PackedScene

func _on_body_entered(body):
	
	if (body.name == "CharacterBody2D"):
		GlobalVars.player_return_position = Vector2(100, 500)
		get_tree().change_scene_to_packed(target_level)

