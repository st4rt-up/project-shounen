extends Node2D
class_name InputManager

@export var inputs : InputResource
var input_vec : Vector2

func _process(delta) -> void:
	input_vec = Input.get_vector(
		inputs.move_left,
		inputs.move_right,
		inputs.move_up,
		inputs.move_down
		).normalized()

func any_directionals() -> bool:
	if input_vec.length() > 0:
		return true
	else:
		return false

func any_action_button() -> bool:
	var action_pressed : bool = (
		Input.is_action_pressed(inputs.action1) or 
		Input.is_action_pressed(inputs.action2) or 
		Input.is_action_pressed(inputs.action3)
		)
		
	return action_pressed
