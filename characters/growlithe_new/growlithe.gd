extends CharacterBody2D

@export var sprite: AnimatedSprite2D
@export var hurtbox_manager: HurtboxManager
var facing_h : Vector2 = Vector2.RIGHT

func face_left() -> void:
	facing_h = Vector2.LEFT
	if sprite:
		sprite.flip_h = true
	
	if hurtbox_manager:
		hurtbox_manager.face_left()
	

func face_right() -> void:
	facing_h = Vector2.RIGHT
	
	if sprite:
		sprite.flip_h = false

	if hurtbox_manager:
		hurtbox_manager.face_right()
