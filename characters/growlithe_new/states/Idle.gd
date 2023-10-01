extends State

@export var run_state : State

@export var health_component: HealthComponent

@export var input_manager: InputManager
@onready var inputs = input_manager.inputs

@export var action1 : Animation
@export var action2 : Animation
@export var action3 : Animation

func enter() -> void:
	sprite.play("idle")
	hurtbox_manager.change_to(hurtbox)

func every_frame() -> void:
	
	# placeholder hurt state testing code
	if Input.is_action_pressed("attack_1"):
		print("ATTACK !!!")
		var attack = Attack.new()
		attack.hitstun = 60
		attack.knockback_force = 180
		health_component.take_damage(attack)
	
	if Input.is_action_pressed(inputs.action1):
		if action1:
			exit(action1)
	elif Input.is_action_pressed(inputs.action2):
		if action1:
			exit(action2)
	elif Input.is_action_pressed(inputs.action3):
		if action1:
			exit(action3)
	
	if input_manager.any_directionals():
		exit(run_state)
