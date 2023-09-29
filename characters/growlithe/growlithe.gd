extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = %sprite
var facing: String = "right"

func face_left():
	sprite.flip_h = true
	facing = "left"
	pass

func face_right():
	sprite.flip_h = false
	facing = "right"
	pass
