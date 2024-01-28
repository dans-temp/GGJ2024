extends Area2D
const DialogBox = preload("res://Scripts/Dialog Box.gd")
var dialog_manager_scene = preload("res://Scenes/dialog_manager.tscn")
var dialog_manager_instance = null
@onready var transition_sprite = $"../../../transition_sprite"

func _on_body_entered(body):
	if body.name == "CharacterBody2D" and dialog_manager_instance == null and GlobalVars.lvl2_cutscenes_played[0] == false:
		dialog_manager_instance = dialog_manager_scene.instantiate()
		GlobalVars.scenario = "2-1"
		GlobalVars.lvl2_cutscenes_played[0] = true
		add_child(dialog_manager_instance)
