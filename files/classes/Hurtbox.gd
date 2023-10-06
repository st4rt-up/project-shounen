extends Area2D
class_name Hurtbox

var health_component : HealthComponent
var is_enabled: bool = false

func _ready() -> void:
	disable()

func enable() -> void:
	is_enabled = true
	set_monitorable(true)
	set_monitoring(true)
	
	for child in get_children():
		if child is CollisionShape2D:
			child.set_disabled(false)
			child.visible = true

func disable() -> void:
	is_enabled = false
	set_monitorable(false)
	set_monitoring(false)
	
	for child in get_children():
		if child is CollisionShape2D:
			child.set_disabled(true)
			child.visible = false

func is_active() -> bool:
	return is_enabled

func get_hit(attack : Attack) -> void:
	if health_component:
		health_component.get_hit(attack)
	
