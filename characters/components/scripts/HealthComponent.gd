extends FrameManager
class_name HealthComponent

@export var sprite : AnimatedSprite2D
@export var hurtbox_manager: HurtboxManager
@export var state_manager: StateManager
@export var hurt_state: State
@export var MAX_HEALTH:int = 15

var health: int
var invuln_timer: int

var attack: Attack

func frame_0() -> void:
	health = MAX_HEALTH
	
func every_frame() -> void:
	if invuln_timer > 0:
		invuln_timer -= 1
	else:
		hurtbox_manager.enable()
		take_damage(attack)
	
func hitbox_enter(attack: Attack) -> void:
	self.attack = attack

func hitbox_leave(attack: Attack) -> void:
	self.attack = null
	
func take_damage(attack: Attack) -> void:
	health -= attack.attack_damage
	
	if hurtbox_manager:
		hurtbox_manager.disable()
	
	if hurt_state:
		hurt_state.attack = attack
		state_manager.change_to(hurt_state)
		
		invuln_timer = attack.hitstun + 40
		sprite.flicker(invuln_timer / 60)
		
		
		

	if health <= 0:
		# death logic
		pass
