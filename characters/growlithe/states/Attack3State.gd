extends BaseState

func frame_0():
	anim.play("attack_spec")
	
	owner.velocity.y = 0
	owner.velocity.x = 0
	owner.move_and_slide()

func frame_20():
	pass
func frame_40():	
	exit("IdleState")
