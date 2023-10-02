extends State

@export var friction: float = 0.05
@export var idle_state : State
@export var hit_delay : int = 0 # in frames

var attack : Attack
var hitstun_timer : int = 60 # in frames
var hit_delay_timer : int = 0

func enter() -> void:
	sprite.play("hurt")
	character.stop_moving()
	
	if attack:
		hitstun_timer = attack.hitstun + hit_delay
		
		if hit_delay == 0:
			character.velocity = attack.facing_h * attack.knockback_force
		else:
			hit_delay_timer = hit_delay

func physics_process(delta) -> void:
	if hit_delay_timer > 0:
		hit_delay_timer -= 1
		
		if hit_delay_timer == 0:
			character.velocity = attack.facing_h * attack.knockback_force
	
	if character.velocity.length() > 0:
		character.velocity -= character.velocity * friction
	
	character.move_and_slide()
	
	if hitstun_timer > 0:
		hitstun_timer -= 1
	else:
		hitstun_timer = 0
		exit(idle_state)
