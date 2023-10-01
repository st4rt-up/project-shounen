extends State

@export var idle_state : State

@export var health_component : HealthComponent

@export var input_manager: InputManager
@onready var inputs = input_manager.inputs

@export var action1 : Animation
@export var action2 : Animation
@export var action3 : Animation

@export var speed: int = 360


func enter() -> void:
	sprite.play("run")
	hurtbox_manager.change_to(hurtbox)

func every_frame() -> void:
	owner.velocity = input_manager.input_vec * speed
	owner.move_and_slide()
	
	if Input.is_action_pressed(inputs.move_left):
		character.face_left()
	elif Input.is_action_pressed(inputs.move_right):
		character.face_right()
		
	if !input_manager.any_directionals():
		exit(idle_state)
		
	if Input.is_action_pressed("attack_1"):
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
