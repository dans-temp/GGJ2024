extends Area2D
const DialogBox = preload("res://Scripts/Dialog Box.gd")
var dialog_manager_scene = preload("res://Scenes/dialog_manager.tscn")
var dialog_manager_instance = null
func _on_body_entered(body):
	if body.name == "CharacterBody2D" and dialog_manager_instance == null and GlobalVars.lvl2_cutscenes_played[1] == false:
		dialog_manager_instance = dialog_manager_scene.instantiate()
		GlobalVars.scenario = "2-2"
		add_child(dialog_manager_instance)
		GlobalVars.lvl2_cutscenes_played[1] = true
		GlobalVars.player_return_position = $"../../CharacterBody2D".position
