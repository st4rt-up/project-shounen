extends Node2D
class_name HurtboxManager

var facing_h : Vector2 = Vector2.RIGHT
var hurtbox: Hurtbox 

func change_to(new_hurtbox) -> void:
	if hurtbox:
		hurtbox.disable()
	
	if new_hurtbox is Hurtbox:
		hurtbox = new_hurtbox
	else:
		hurtbox = get_node(new_hurtbox)
	
	hurtbox.enable()

func face_left() -> void:
	scale.x = -1
	facing_h = Vector2.LEFT
	
func face_right() -> void:
	scale.x = 1
	facing_h = Vector2.RIGHT

func enable() -> void:
	hurtbox.enable()

func disable() -> void:
	hurtbox.disable()
	

