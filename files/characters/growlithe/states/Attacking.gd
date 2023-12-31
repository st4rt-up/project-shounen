extends State


@export var input_manager: InputManager
@onready var inputs = input_manager.inputs
@export var animation_manager: AnimationPlayer

@export var idle_state : State

@export var action1 : StringName
@export var action2 : StringName
@export var action3 : StringName

@export var projectile1 : AttackResource
@export var projectile2 : AttackResource
@export var projectile3 : AttackResource

func enter() -> void:
	character.velocity.x = 0
	character.velocity.y = 0
	
	animation_manager.stop()
	
	if Input.is_action_pressed(inputs.action1):
		if action1:
			animation_manager.play(action1)
	elif Input.is_action_pressed(inputs.action2):
		if action2:
			animation_manager.play(action2)
	elif Input.is_action_pressed(inputs.action3):
		if action3:
			animation_manager.play(action3)

func move_end() -> void:
	character.stop_moving()
	exit(idle_state)

func _physics_process(delta):
	character.move_and_slide()
	
func fireball_init() -> void:
	# character.velocity = character.facing_h * 180
	return
	
func move_during_fireball() -> void:
	var attacking_vel = 300
	if character.facing_h == Vector2.LEFT:
		attacking_vel = -attacking_vel
	character.velocity.x = attacking_vel
	
func roar_init() -> void:
	return
	
func flamethrower_init() -> void:
	return

func shoot_roar() -> void:
	shoot_proj(projectile3)

func shoot_fireball() -> void:
	shoot_proj(projectile2)

func shoot_flamethrower() -> void:
	shoot_proj(projectile1)

func shoot_proj(projectile: AttackResource) -> void:
	var proj = load(projectile.path)
	var instance = proj.instantiate()
	
	instance.attack_damage = projectile.attack_damage
	instance.knockback_force = projectile.knockback_force
	instance.knockback_dir = projectile.knockback_dir
	instance.hitstun = projectile.hitstun
	instance.invuln = projectile.invuln
	instance.lifetime = projectile.lifetime
	instance.attack_vel = projectile.attack_vel
	instance.h_offset = projectile.h_offset
	instance.v_offset = projectile.v_offset
	
	instance.facing = projectile.facing
	instance.facing.x = character.facing_h.x
	
	instance.position = owner.position
	get_tree().root.add_child(instance)

func shoot_proj_dir(projectile: AttackResource, dir: Vector2, h_offset := 0, v_offset := 0) -> void:
	var proj = load(projectile.path)
	var instance = proj.instantiate()
	
	instance.attack_damage = projectile.attack_damage
	instance.knockback_force = projectile.knockback_force
	instance.knockback_dir = projectile.knockback_dir
	instance.hitstun = projectile.hitstun
	instance.invuln = projectile.invuln
	instance.lifetime = projectile.lifetime
	instance.attack_vel = projectile.attack_vel
	instance.h_offset = projectile.h_offset
	instance.v_offset = projectile.v_offset
	
	instance.facing = dir
	instance.facing.x = character.facing_h.x
	
	instance.position = owner.position
	get_tree().root.add_child(instance)
