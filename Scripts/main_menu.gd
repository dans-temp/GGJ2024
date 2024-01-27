extends Node

func _input(event):
	if (Input.is_action_just_pressed("ui_accept")):
		get_tree().change_scene_to_file("res://scenes/level1.tscn")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level1.tscn")



