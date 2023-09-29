extends State

@onready var sprite: AnimatedSprite2D = %sprite
var input_vec

@export var speed = 180

func enter():
	sprite.play("run")	
	
func every_frame(delta):
	input_vec = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	var directions_pressed = sqrt(input_vec.x * input_vec.x + input_vec.y * input_vec.y) > 0
	
	owner.velocity = input_vec * speed
	owner.move_and_slide()
	
	if input_vec.x < 0:
		owner.face_left()
	elif input_vec.x > 0:
		owner.face_right()
		
	if not directions_pressed:
		# exit this state, into idle state
		exit("Idle")
		
	if Input.is_action_pressed("attack_1"):
		exit("Action1")
	elif Input.is_action_pressed("attack_2"):
		exit("Action2")
	elif Input.is_action_pressed("attack_3"):
		exit("Action3")
