extends Node2D
class_name HitboxManager

var facing_h : Vector2 = Vector2.RIGHT
var hitbox : Hitbox 
var is_disabled : bool = false

func change_to(new_hitbox) -> void:
	if hitbox:
		hitbox.disable()
	
	if new_hitbox is Hitbox:
		hitbox = new_hitbox
	else:
		hitbox = get_node(new_hitbox)
	
	if !is_disabled:
		hitbox.enable()

func face_left() -> void:
	scale.x = -1
	facing_h = Vector2.LEFT
	
func face_right() -> void:
	scale.x = 1
	facing_h = Vector2.RIGHT

func enable() -> void:
	hitbox.enable()
	is_disabled = false

func disable() -> void:
	hitbox.disable()
	is_disabled = true
