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

var attack: Attack

func _physics_process(delta):
	if invuln_timer > 0:
		invuln_timer -= 1
		
		if invuln_timer == 0:
			hurtbox_manager.enable()
	
func _ready() -> void:
	health = MAX_HEALTH
	
func hitbox_enter(attack: Attack) -> void:
	self.attack = attack

func hitbox_leave(attack: Attack) -> void:
	self.attack = null
	
func take_damage(attack: Attack) -> void:
	if invuln_timer > 0:
		return
		
		
	health -= attack.attack_damage
	
	if hurtbox_manager:
		hurtbox_manager.disable()
	
	if hurt_state:
		hurt_state.attack = attack
		state_manager.change_to(hurt_state)
		invuln_timer = attack.hitstun + hit_delay # + 60
		sprite.flicker(invuln_timer / 60)
		
	if health <= 0:
		# death logic
		pass
