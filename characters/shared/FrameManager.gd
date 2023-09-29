extends Node
class_name FrameManager

# intended to be a superclass for objects that want to have frame-by-frame logic 

var current_frame:int = 0

func _physics_process(delta):
	physics_process(delta)

func _ready():
	frame_0()
	
# functions that don't need processing every tick can override
# _physics_process and call it themselves

func physics_process(delta):
	current_frame += 1
	
	var func_name = "frame_" + str(current_frame)
	if self.has_method(func_name):
		var frame_func = Callable(self, func_name)
		frame_func.call()
	
	every_frame(delta)

# functions intended to be implemented by subclasses

func next_frame():
	pass

func every_frame(_delta):
	pass

func frame_0():
	pass
