extends Area2D
const DialogBox = preload("res://Scripts/Dialog Box.gd")
var dialog_manager_scene = preload("res://Scenes/dialog_manager.tscn")
var dialog_manager_instance = null
@onready var character_body_2d = $"../../SceneObjects/CharacterBody2D"

var fall_counter = 0

func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		fall_counter += 1
		if fall_counter == 15:
			dialog_manager_instance = dialog_manager_scene.instantiate()
			GlobalVars.scenario = "5-4"
			add_child(dialog_manager_instance)
			GlobalVars.player_return_position = Vector2(2200,-500)
		character_body_2d.position = GlobalVars.player_return_position
		
