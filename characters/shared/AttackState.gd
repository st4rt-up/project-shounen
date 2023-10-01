extends State
class_name AttackState

func shoot_proj(proj, dir):
	var instance = proj.instantiate()
	instance.init(dir)
	instance.position = owner.position
	add_child(instance) 
