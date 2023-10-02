extends State

@export var speed: int = 160
@export var hurtbox : Hurtbox

@export var idle_state : State
@export var attacking_state : State

@export var health_component : HealthComponent
@export var input_manager: InputManager
@onready var inputs = input_manager.inputs



func enter() -> void:
	sprite.play("run")
	hurtbox_manager.change_to(hurtbox)

func physics_process(delta) -> void:
	owner.velocity = input_manager.input_vec * speed
	owner.move_and_slide()
	
	if Input.is_action_pressed(inputs.move_left):
		character.face_left()
	elif Input.is_action_pressed(inputs.move_right):
		character.face_right()
		
	if !input_manager.any_directionals() and fsm.state == self:
		exit(idle_state)
		
	if Input.is_action_pressed("attack_1"):
		var attack = Attack.new()
		attack.hitstun = 60
		attack.knockback_force = 250
		attack.facing_h = character.facing_h * -1
		health_component.take_damage(attack)
		
	if input_manager.any_action_button() and fsm.state == self:
		exit(attacking_state)
