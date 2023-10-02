@tool
extends Resource
class_name AttackResource

@export var path : String
@export var attack_damage : int : set = _set_damage, get = _get_damage
@export var knockback_force : int
@export var hitstun : int

@export var lifetime : int

@export var attack_velocity : float

@export var h_offset : int : set = _set_h_offset, get = _get_h_offset
@export var v_offset : int : set = _set_v_offset, get = _get_v_offset

func _set_damage(new_damage: int) -> void:
	attack_damage = clamp(new_damage, 0, 15)
	
func _get_damage() -> int:
	return attack_damage
	
func _set_h_offset(new_offset: int) -> void:
	h_offset = clamp(new_offset, 0, 256)

func _get_h_offset() -> int:
	return h_offset

func _set_v_offset(new_offset: int) -> void:
	v_offset = clamp(new_offset, 0, 256)

func _get_v_offset() -> int:
	return v_offset
