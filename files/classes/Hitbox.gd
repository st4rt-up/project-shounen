extends Node
class_name Hitbox

var attack : Attack
var is_enabled: bool = false

func _ready() -> void:
	self.area_entered.connect(_on_hitbox_area_entered)
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

func _on_hitbox_area_entered(area):
	if area is Hurtbox:
		if area.owner != attack.proj_owner:
			area.get_hit(attack)
