extends CharacterBody2D

const DialogBox = preload("res://Scripts/Dialog Box.gd")
var dialog_manager_scene = preload("res://Scenes/dialog_manager.tscn")
var dialog_manager_instance = null
		
func hit():
	dialog_manager_instance = dialog_manager_scene.instantiate()
	GlobalVars.scenario = "5-3"
	add_child(dialog_manager_instance)
	GlobalVars.player_return_position = $"../../CharacterBody2D".position
	$".".hide()
	$".".position = Vector2(-10000, 10000)
	
