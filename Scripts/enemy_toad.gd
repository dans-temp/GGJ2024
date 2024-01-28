extends CharacterBody2D

@onready var toad = $"."

func _ready():
	if GlobalVars.turn_battle_complete != 0:
		toad.queue_free()

