extends BaseState

@export var attacking_vel = 150

func frame_0():
	anim.play("attack_phys")
	
	owner.velocity.y = 0
	
	if owner.facing == "left":
		owner.velocity.x = -attacking_vel
	if owner.facing == "right":
		owner.velocity.x = attacking_vel
	
func frame_15():
	var attack2 = preload("res://characters/growlithe/attacks/attack_2.tscn")
	var instance = attack2.instantiate()
	
	instance.init(owner.facing)
	instance.position = owner.position
	add_child(instance)

func frame_50():
	owner.velocity.x = 0
	owner.velocity.y = 0
	
	exit("IdleState")


func every_frame(_delta):
	owner.move_and_slide()
