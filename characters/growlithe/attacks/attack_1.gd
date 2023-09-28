extends Node2D

@onready var anim = %anim
var attack_vel = 6
var offset = 100

var timer = 0
var lifetime = 90

var facing

func _ready():
	anim.play("start")
	
	if facing == "right":
		anim.flip_h = false
		position.x += offset
	elif facing == "left":
		anim.flip_h = true
		position.x -= offset

func init(dir):
	facing = dir
	
func _on_anim_animation_finished():
	anim.play("loop")

func _process(delta):
	if facing == "right":
		position.x += attack_vel
	elif facing == "left":
		position.x -= attack_vel
	
	timer += 100 * delta
	
	if timer >= lifetime:
		kill()
	


func kill():
	queue_free()
