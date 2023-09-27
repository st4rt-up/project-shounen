extends Node

var fsm: StateManager
var input_vector
@onready var _animated_sprite = $AnimatedSprite2D

@export var speed = 300.0

signal direction_changed

func enter():
	pass

func exit(next_state):
	fsm.change_to(next_state)
	
func process(delta):
	input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	var directions_pressed = sqrt(input_vector.x * input_vector.x + input_vector.y * input_vector.y) > 0
	
	_animated_sprite.play("run")
	
	owner.velocity = input_vector * speed
	owner.move_and_slide()
	
	if not directions_pressed:
		exit("IdleState")
	# owner.velocity = input_vector * speed
	

	
