extends State

var input_vec
@onready var anim = %anim

func frame_0():
	# anim.play("idle")
	pass
	
func every_frame(delta):
	input_vec = Input.get_vector(
		"move_left", 
		"move_right", 
		"move_up", 
		"move_down"
		).normalized()
		
	var directions_pressed = sqrt(input_vec.x * input_vec.x + input_vec.y * input_vec.y) > 0
	
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
