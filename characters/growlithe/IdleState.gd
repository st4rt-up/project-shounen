extends BaseState

var input_vector

func enter():
	anim.play("idle")
	
func process(delta):
	input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	var directions_pressed = sqrt(input_vector.x * input_vector.x + input_vector.y * input_vector.y) > 0
	
	
	
	if directions_pressed:
		exit("RunState")
	
