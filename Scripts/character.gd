extends CharacterBody2D

@onready var gunshot = $CharacterContainer/Sprite2D/Marker2D/gunshot
@onready var rocketlaunch = $CharacterContainer/Sprite2D/Marker2D/rocketlaunch
@onready var character_container = $CharacterContainer

const SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var sprite_2d = $CharacterContainer/Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var isLeft = false
var flip_scale = Vector2(-1, 1)


func _physics_process(delta):
	if !GlobalVars.disable_movement:
		var player_position = global_position
		# Animations
		if (velocity.x > 1 || velocity.x < -1):
			sprite_2d.animation = "running"
		else:
			sprite_2d.animation = "default"
		# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta
			sprite_2d.animation = "jumping"

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			
		if player_position.x > get_global_mouse_position().x:
			isLeft = true
		else:
			isLeft = false

		# Get the input direction and handle the movement/deceleration.
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, 25)

		move_and_slide()
		#flip player and rpg if needed
		if isLeft:
			character_container.scale = Vector2(flip_scale.x, flip_scale.y)
		else:
			character_container.scale = Vector2(1, 1)
	else:
		sprite_2d.animation = "default"
		

func play_gunshot_animation():
	gunshot.play("gunshot")
	rocketlaunch.play()
