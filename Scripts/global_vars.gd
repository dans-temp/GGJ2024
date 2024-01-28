extends Node

signal shake_camera
var scenario = "0"
var disable_movement = false
var disable_fire = false
var turn_battle_complete = 0
var turn_battle_enemy = null
var paused = false
var player_return_position = Vector2(100, 500)
var lvl2_cutscenes_played = [false,false,false,false]
var final_boss_battle = false
