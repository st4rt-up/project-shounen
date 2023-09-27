extends Node

var fsm: StateManager
var input_vector

func enter():
	
	pass

func exit(next_state):
	fsm.change_to(next_state)
	
func _process(delta):
	input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	var directions_pressed = sqrt(input_vector.x * input_vector.x + input_vector.y * input_vector.y) > 0
