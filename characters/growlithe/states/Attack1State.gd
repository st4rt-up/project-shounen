extends BaseState

@export var attacking_vel = 150

func frame_0():
	anim.play("attack_spec")
	
	owner.velocity.y = 0
	owner.velocity.x = 0
	
	if owner.facing == "left":
		owner.velocity.x = -owner.velocity.x

func frame_14():
	var attack1 = preload("res://characters/growlithe/attacks/attack_1.tscn")
	var instance = attack1.instantiate()
	
	instance.init(owner.facing)
	instance.position = owner.position
	add_child(instance)
	
func frame_50():
	owner.velocity.x = 0
	owner.velocity.y = 0
	
	exit("IdleState")
	
func every_frame(_delta):
	owner.move_and_slide()

func _on_anim_animation_finished():
	pass
