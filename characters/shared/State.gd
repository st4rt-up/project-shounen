extends FrameManager
class_name State

var fsm: StateManager	

func _physics_process(delta):
	pass

func enter():
	print("State ", self.name, " not implemented, exiting")
	fsm.back()

func exit(next_state):
	current_frame = 0
	fsm.change_to(next_state)
	
func every_frame(_delta):
	pass
