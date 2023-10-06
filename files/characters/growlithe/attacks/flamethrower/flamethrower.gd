extends Attack

func frame_0() -> void:
	if sprite:
		sprite.play("loop")
		
	if facing.x > 0: # facing right
		face_right()
	elif facing.x < 0: # facing left
		face_left()
	
