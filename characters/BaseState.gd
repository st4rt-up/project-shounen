extends Node
class_name BaseState

var fsm: StateManager
@onready var anim = %anim

var current_frame = 0

func enter():
	current_frame = 0
	frame_0()

func process(delta):
	current_frame += 1
	var func_name = "frame_" + str(current_frame)
	if self.has_method(func_name):
		var frame_func = Callable(self, func_name)
		frame_func.call()
	
	every_frame(delta)

func frame_0():
	pass

func every_frame(_delta):
	pass

func exit(next_state):
	current_frame = 0
	fsm.change_to(next_state)
