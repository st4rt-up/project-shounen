extends Node2D
class_name HurtboxManager

@export var health_component : HealthComponent

var projOwner : Node2D
var facing_h : Vector2 = Vector2.RIGHT
var hurtbox : Hurtbox 
var is_disabled : bool = false

func _ready() -> void:
	for child in get_children():
		if child is Hurtbox:
			child.health_component = health_component

func change_to(new_hurtbox) -> void:
	if hurtbox:
		hurtbox.disable()
	
	if new_hurtbox is Hurtbox:
		hurtbox = new_hurtbox
	else:
		hurtbox = get_node(new_hurtbox)
	
	if !is_disabled:
		hurtbox.enable()

func face_left() -> void:
	scale.x = -1
	facing_h = Vector2.LEFT
	
func face_right() -> void:
	scale.x = 1
	facing_h = Vector2.RIGHT

func enable() -> void:
	hurtbox.enable()
	is_disabled = false

func disable() -> void:
	hurtbox.disable()
	is_disabled = true


