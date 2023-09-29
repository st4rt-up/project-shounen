extends State

@onready var sprite: AnimatedSprite2D = %sprite
var input_vec

func enter():
	sprite.play("idle")	

func every_frame(delta):
	input_vec = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	var directions_pressed = sqrt(input_vec.x * input_vec.x + input_vec.y * input_vec.y) > 0
	
	if directions_pressed:
		exit("Run")
		
	if Input.is_action_pressed("p2_attack_1"):
		exit("Hurt")
	
	if Input.is_action_pressed("attack_1"):
		exit("Action1")
	elif Input.is_action_pressed("attack_2"):
		exit("Action2")
	elif Input.is_action_pressed("attack_3"):
		exit("Action3")
