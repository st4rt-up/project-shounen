extends Node2D
class_name BaseAttack

@onready var anim = %anim
var timer = 0
var lifetime = 200

var attack_vel = 0

var h_offset = 0
var v_offset = 0
var facing

func _ready():
	on_run()
	if facing == "right":
		anim.flip_h = false
		position.x += h_offset
	elif facing == "left":
		anim.flip_h = true
		position.x -= h_offset
	
	position.y += v_offset

func _process(delta):
	every_frame(delta)
	
	if facing == "right":
		position.x += attack_vel * delta
	elif facing == "left":
		position.x -= attack_vel * delta
	
	timer += 100 * delta
	
	if timer >= lifetime:
		kill()
	
func every_frame(delta):
	pass

func on_run():
	pass
	
func kill():
	queue_free()
