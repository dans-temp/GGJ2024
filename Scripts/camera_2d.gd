extends Camera2D

#Screen Shake
var is_shaking = false
var shake_duration
var shake_intensity
var max_height = 1000

func _process(delta):
#screen shake
	if is_shaking:
		if shake_intensity < 0:
			is_shaking = false
			offset.x = 0
			offset.y = 0
		else:
			# Randomly offset the camera position within a certain intensity
			offset.x = randf() * 2.0 * shake_intensity 
			offset.y = randf() * 2.0 * shake_intensity
			shake_intensity -= shake_duration
	else:
		# Reset the offset when not shaking
		offset.x = 0
		offset.y = 0

# Call this function to start the camera shake
func start_shake(intensity, duration):
	is_shaking = true
	shake_intensity = intensity
	shake_duration = duration
