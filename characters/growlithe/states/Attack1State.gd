extends BaseState

@export var attack_vel = 300

func enter():
	anim.play("attack_phys")
	
	owner.velocity.y = 0
	owner.velocity.x = attack_vel
	
	if owner.facing == "left":
		owner.velocity.x = -owner.velocity.x
	
	var attack1 = preload("res://characters/growlithe/attacks/attack_1.tscn")
	var instance = attack1.instantiate()
	
	instance.init(owner.facing)
	instance.position = owner.position
	add_child(instance)
	
func process(_delta):
	owner.move_and_slide()


func _on_anim_animation_finished():
	owner.velocity.x = 0
	owner.velocity.y = 0
	
	exit("IdleState")
