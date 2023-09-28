extends Node2D

@onready var anim = %anim
var attack_vel = 5
var facing

func _ready():
	anim.play("start")
	
	if facing == "right":
		anim.flip_h = false
	elif facing == "left":
		anim.flip_h = true

func init(dir):
	facing = dir
	
func _on_anim_animation_finished():
	anim.play("loop")

func _process(delta):
	if facing == "right":
		position.x += attack_vel
	elif facing == "left":
		position.x -= attack_vel
	


func kill():
	pass
