extends Node2D
class_name StateManager

@export var initial_state : State
var state: State
var history = []

func _ready() -> void:
	state = initial_state
	_enter_state()
	
func change_to(new_state) -> void:
	history.append(state.name)
	
	if new_state is State:
		state = new_state
	else:
		state = get_node(new_state)
	_enter_state()

func back() -> void:
	if history.size() > 0:
		state = get_node(NodePath(history.pop_back()))
		_enter_state()
	
func _enter_state() -> void:
	print("Entering state: ", state.name)

	state.fsm = self
	state.enter()
	
func _process(delta) -> void:
	if state.has_method("process"):
		state.process(delta)

func _physics_process(delta) -> void:
	if state.has_method("advance_frame"):
		state.advance_frame(delta)
	
	if state.has_method("physics_process"):
		state.physics_process(delta)
