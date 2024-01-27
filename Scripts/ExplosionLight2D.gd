extends PointLight2D

# Initial energy value of the light
var initial_energy: float = 1.0

func _ready():
	# Store the initial energy value
	initial_energy = energy
	# Start the timer
	$Timer.start(0.1)

# Method connected to the Timer node's timeout signal
func _on_timer_timeout():
	if energy > 0:
		energy = energy - 0.1
	else:
		queue_free()

	
