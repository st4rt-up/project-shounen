extends State

@export var idle_state : State
@export var friction: float = 0.1

var attack : Attack
var hitstun_timer : int

func enter():
	sprite.play("hurt")
	character.velocity.x = 0
	character.velocity.y = 0
	hitstun_timer = attack.hitstun
	character.velocity = attack.facing_h * attack.knockback_force * -1

func every_frame():
	if character.velocity.length() > 0:
		character.velocity -= character.velocity * friction
	
	character.move_and_slide()
	if hitstun_timer > 0:
		hitstun_timer -= 1
	else:
		hitstun_timer = 0
		exit(idle_state)
