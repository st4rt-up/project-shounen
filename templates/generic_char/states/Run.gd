extends State

@export var speed = 180
@onready var anim = %anim

func frame_0():
	anim.play("run")
	
func every_frame(_delta):
	var input_vec = Input.get_vector(
		"move_left", 
		"move_right", 
		"move_up", 
		"move_down").normalized()
		
	var directions_pressed = sqrt(input_vec.x * input_vec.x + input_vec.y * input_vec.y) > 0
	
	# owner.position += input_vector * (speed/150)
	
	owner.velocity = input_vec * speed
	owner.move_and_slide()
	
	if input_vec.x < 0:
		owner.face_left()
		
	elif input_vec.x > 0:
		owner.face_right()
		
	if not directions_pressed:
		# exit this state, into idle state
		exit("IdleState")
		
	if Input.is_action_pressed("attack_1"):
		exit("Attack1State")
	elif Input.is_action_pressed("attack_2"):
		exit("Attack2State")
	elif Input.is_action_pressed("attack_3"):
		exit("Attack3State")
