extends BaseState

@export var speed = 180

func frame_0():
	anim.play("run")
	
func every_frame(_delta):
	var input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	var directions_pressed = sqrt(input_vector.x * input_vector.x + input_vector.y * input_vector.y) > 0
	
	# owner.position += input_vector * (speed/150)
	
	owner.velocity = input_vector * speed
	owner.move_and_slide()
	
	if input_vector.x < 0:
		owner.facing = "left"
		anim.flip_h = true
		
	elif input_vector.x > 0:
		owner.facing = "right"
		anim.flip_h = false
		
	if not directions_pressed:
		# exit this state, into idle state
		exit("IdleState")
		
	if Input.is_action_pressed("attack_1"):
		exit("Attack1State")
	elif Input.is_action_pressed("attack_2"):
		exit("Attack2State")
	elif Input.is_action_pressed("attack_3"):
		exit("Attack3State")
