extends FrameManager
class_name State

var fsm: StateManager	

@export var sprite : AnimatedSprite2D
@export var character : CharacterBody2D
@export var hurtbox_manager : HurtboxManager

# DO NOT REMOVE
func physics_process(delta) -> void:
	advance_frame(delta)

func enter() -> void:
	print("State ", self.name, " not implemented, exiting")
	fsm.back()

func exit(next_state) -> void:
	fsm.change_to(next_state)
	
func every_frame() -> void:
	return
