extends Node
class_name StateManager

var state: Object
var history = []

func _ready():
	state = get_node("IdleState")
	_enter_state()
	
func change_to(new_state):
	history.append(state.name)
	state = get_node(new_state)
	_enter_state()

func back():
	if history.size() > 0:
		state = get_node(history.pop_back())
		_enter_state()
	
func _enter_state():
	print("Entering state: ", state.name)

	state.fsm = self
	state.enter()
	
func _process(delta):
	if state.has_method("process"):
		state.process(delta)

func _notification(what):
	if state && state.has_method("notification"):
		state.notification(what)
