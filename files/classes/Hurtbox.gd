extends Node
class_name Hurtbox

@export var health_component : HealthComponent

var is_enabled: bool = false

func _ready() -> void:
	disable()

func enable() -> void:
	is_enabled = false
	
	for child in get_children():
		if child is CollisionShape2D:
			child.set_disabled(false)
			child.visible = true

func disable() -> void:
	for child in get_children():
		if child is CollisionShape2D:
			child.set_disabled(true)
			child.visible = false

func is_active() -> bool:
	return is_enabled
