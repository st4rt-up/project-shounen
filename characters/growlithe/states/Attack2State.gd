extends BaseState

func enter():
	anim.play("attack_spec")
	
	owner.velocity.y = 0
	owner.velocity.x = 0

	
func process(_delta):
	owner.move_and_slide()


func _on_anim_animation_finished():
	owner.velocity.x = 0
	owner.velocity.y = 0
	
	exit("IdleState")
