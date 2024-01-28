extends CharacterBody2D
		
func hit():
	if GlobalVars.lvl2_cutscenes_played[2]:
		queue_free()
