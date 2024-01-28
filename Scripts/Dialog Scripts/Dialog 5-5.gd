extends Area2D
const DialogBox = preload("res://Scripts/Dialog Box.gd")
var dialog_manager_scene = preload("res://Scenes/dialog_manager.tscn")
var dialog_manager_instance = null
var battle_scene = preload("res://Scenes/turn_based_battle2.tscn")
var battle_scene_instance = null
@onready var animation_player = $"../../../UI/TransitionRect2/AnimationPlayer"

func _on_body_entered(body):
	if body.name == "CharacterBody2D" and dialog_manager_instance == null:
		dialog_manager_instance = dialog_manager_scene.instantiate()
		GlobalVars.scenario = "5-5"
		add_child(dialog_manager_instance)
		animation_player.play("flicker")
		$Timer.start(1.5)
		await $Timer.timeout
		get_tree().change_scene_to_file("res://Scenes/turn_based_battle.tscn")

