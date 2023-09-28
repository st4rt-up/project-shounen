extends BaseState

var input_vector

func frame_0():
	anim.play("idle")
	
func every_frame(delta):
	input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	var directions_pressed = sqrt(input_vector.x * input_vector.x + input_vector.y * input_vector.y) > 0
	
	if directions_pressed:
		exit("RunState")
		
	if Input.is_action_pressed("p2_attack_1"):
		exit("HurtState")
	
	if Input.is_action_pressed("attack_1"):
		exit("Attack1State")
	elif Input.is_action_pressed("attack_2"):
		exit("Attack2State")
	elif Input.is_action_pressed("attack_3"):
		exit("Attack3State")
	

	
