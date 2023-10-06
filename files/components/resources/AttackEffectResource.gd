@tool
extends Resource
class_name AttackEffectResource

var character: CharacterBody2D

@export var attack_damage : int : set = _set_damage, get = _get_damage

@export var hitstun: int # in frames
@export var invuln: int # in frames

func on_hit() -> void:
	# print(character.name + " was hit!")
	return
	
func _set_damage(new_damage: int) -> void:
	attack_damage = clamp(new_damage, 0, 15)
	
func _get_damage() -> int:
	return attack_damage
