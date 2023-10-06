@tool
extends Resource
class_name AttackResource

@export var path : String

@export var projOwner : Node2D
@export var attack_effect : AttackEffectResource
@export var lifetime : int

@export var attack_vel : float

@export var h_offset : int : set = _set_h_offset, get = _get_h_offset
@export var v_offset : int : set = _set_v_offset, get = _get_v_offset
@export var facing : Vector2
	
func _set_h_offset(new_offset: int) -> void:
	h_offset = clamp(new_offset, 0, 256)

func _get_h_offset() -> int:
	return h_offset

func _set_v_offset(new_offset: int) -> void:
	v_offset = clamp(new_offset, 0, 256)

func _get_v_offset() -> int:
	return v_offset
