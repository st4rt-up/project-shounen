extends Node

var fsm: StateManager
var input_vector

@export var speed = 300.0

func enter():
	print("in run state")

func exit(next_state):
	fsm.change_to(next_state)
	
func process(delta):
	print("in run state, in process")
	
	input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	var directions_pressed = sqrt(input_vector.x * input_vector.x + input_vector.y * input_vector.y) > 0
	
	owner.velocity = input_vector * speed
	
	if not directions_pressed:
		exit("IdleState")
	# owner.velocity = input_vector * speed
	

	
