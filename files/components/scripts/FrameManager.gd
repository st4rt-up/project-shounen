extends Node2D
class_name FrameManager

# intended to be a superclass for objects that want to have frame-by-frame logic 

var current_frame : int = 0

func _ready() -> void:
	reset()
	
# functions that don't need processing every tick can override
# _physics_process and call it themselves

func advance_frame(delta) -> void:
	current_frame += 1
	
	var func_name: String = "frame_" + str(current_frame)
	if self.has_method(func_name):
		var frame_func = Callable(self, func_name)
		frame_func.call()
	
	every_frame()

# functions intended to be implemented by subclasses

func every_frame() -> void:
	return

func frame_0() -> void:
	return

func reset() -> void:
	current_frame = 0
	frame_0()
	
