extends Area2D

@onready var character_body_2d = $"../../SceneObjects/CharacterBody2D"



func _on_body_entered(body):
	character_body_2d.position = Vector2(100, 200)
