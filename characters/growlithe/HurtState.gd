extends BaseState

var timer = 0
var hurt_timer_max = 2
var knockback_vel = 10



func enter():
	anim.play("hurt")
	

	
	
func process(delta):
	timer += 1 * delta
	
	if timer >= hurt_timer_max:
		timer = 0
		exit("IdleState")
