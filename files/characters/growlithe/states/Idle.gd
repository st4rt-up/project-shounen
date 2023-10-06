extends State

@export var hurtbox : Hurtbox

@export var run_state : State
@export var attacking_state : State

@export var health_component: HealthComponent

@export var input_manager: InputManager
@onready var inputs = input_manager.inputs

@export var test_attack : AttackResource

func enter() -> void:
	sprite.play("idle")
	hurtbox_manager.change_to(hurtbox)

func physics_process(delta) -> void:	
	if input_manager.any_action_button():
		print("true")
		exit(attacking_state)
	
	if input_manager.any_directionals() and fsm.state == self:
		exit(run_state)


