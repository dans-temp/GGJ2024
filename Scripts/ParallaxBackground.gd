extends ParallaxBackground



func _ready():
	$Timer.start(0.1)


func _on_timer_timeout():
	$ParallaxLayer.motion_offset = $ParallaxLayer.motion_offset + Vector2(0.1, 0)
	$ParallaxLayer2.motion_offset = $ParallaxLayer2.motion_offset + Vector2(0.75, 0)
	$ParallaxLayer3.motion_offset = $ParallaxLayer3.motion_offset + Vector2(3, 0)
