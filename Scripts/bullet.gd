extends CharacterBody2D
@onready var cool_explosion = preload("res://Scenes/cool_explosion.tscn")
@onready var character_body_2d = $"../../SceneObjects/CharacterBody2D"

func _physics_process(delta):
	var collision = move_and_collide(velocity)
	if collision:
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()

		var explo_instance = cool_explosion.instantiate()
		explo_instance.z_index = 1
		explo_instance.global_position = collision.get_position()
		get_parent().add_child(explo_instance)
		queue_free()
		
		# rocket jump
		var player_position = character_body_2d.position
		var explosion_position = collision.get_position()
		# Calculate the distance between the player and explosion positions
		var distance_from_explos = player_position.distance_to(explosion_position)
		if distance_from_explos < 120:
			var char_direction = (get_global_mouse_position() - character_body_2d.position).normalized()
			character_body_2d.set_velocity(-char_direction * 1500)




	

