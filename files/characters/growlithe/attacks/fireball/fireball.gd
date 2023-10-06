extends Attack

func frame_0():
	sprite.play("start")
	hitbox_manager.change_to("start")
	
	if facing.x > 0: # facing right
		face_right()
	elif facing.x < 0: # facing left
		face_left()
		
	hitbox_manager.attack = self

func frame_34() -> void:
	sprite.play("loop")
	hitbox_manager.change_to("loop")
