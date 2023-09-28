extends Node
class_name BaseState

var fsm: StateManager
@onready var anim = %anim

func exit(next_state):
	fsm.change_to(next_state)
