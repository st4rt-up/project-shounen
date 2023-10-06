extends Node2D

@export var test_attack: AttackResource


func _physics_process(delta):
	if Input.is_action_just_pressed("attack_1"):
		shoot_proj(test_attack)
	
	if Input.is_action_just_pressed("attack_2"):
		print("booga wooga!")

func shoot_proj(projectile: AttackResource) -> void:
	var proj = load(projectile.path)
	var instance = proj.instantiate()
	
	instance.owner = null
	
	instance.attack_effect = projectile.attack_effect
	instance.lifetime = projectile.lifetime
	instance.attack_vel = projectile.attack_vel
	instance.h_offset = projectile.h_offset
	instance.v_offset = projectile.v_offset
	
	instance.facing = projectile.facing
	
	instance.position = Vector2(0, 0)
	get_tree().root.add_child(instance)
