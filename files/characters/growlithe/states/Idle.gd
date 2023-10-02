extends State

@export var hurtbox : Hurtbox

@export var run_state : State
@export var attacking_state : State

@export var health_component: HealthComponent

@export var input_manager: InputManager
@onready var inputs = input_manager.inputs


func enter() -> void:
	sprite.play("idle")
	hurtbox_manager.change_to(hurtbox)

func physics_process(delta) -> void:
	# placeholder hurt state testing code
	if Input.is_action_pressed("attack_1"):
		
		var attack = Attack.new()
		attack.hitstun = 60
		attack.facing_h = character.facing_h * -1
		attack.knockback_force = 250
		health_component.take_damage(attack)
	
	if input_manager.any_action_button():
		print("true")
		exit(attacking_state)
	
	if input_manager.any_directionals() and fsm.state == self:
		exit(run_state)
