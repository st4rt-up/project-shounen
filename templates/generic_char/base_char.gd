extends CharacterBody2D

@onready var anim: AnimatedSprite2D= %anim
var facing: String = "right"

func face_left():
	anim.flip_h = true
	facing = "left"
	pass

func face_right():
	anim.flip_h = true
	facing = "right"
	pass
