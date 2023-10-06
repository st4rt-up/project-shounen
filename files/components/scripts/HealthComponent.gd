extends Node2D
class_name HealthComponent

@export var sprite : AnimatedSprite2D
@export var hurtbox_manager: HurtboxManager
@export var state_manager: StateManager
@export var hurt_state: State
@export var MAX_HEALTH:int = 15

@export var hit_delay: int = 0 # in frames

var health: int
var invuln_timer: int

func _physics_process(delta):
	if invuln_timer > 0:
		# print(invuln_timer)
		invuln_timer -= 1
		
		if invuln_timer == 0:
			hurtbox_manager.enable()
	
func _ready() -> void:
	health = MAX_HEALTH

func get_hit(attack: Attack) -> void:
	if invuln_timer > 0:
		return
	
	health -= attack.attack_effect.attack_damage
	
	if health <= 0:
		return
		
	if hurtbox_manager and attack.attack_effect and attack.attack_effect.invuln > 0:
		invuln_timer = attack.attack_effect.invuln
		sprite.flicker(float(invuln_timer) / 60)
		hurtbox_manager.disable()
	
	if hurt_state:
		hurt_state.attack = attack
		state_manager.change_to(hurt_state)
	return
