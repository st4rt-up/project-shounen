extends Node2D

@onready var anim = %anim
var attack_vel = 150
var offset = 80

var timer = 0
var lifetime = 200

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
		position.x += attack_vel * delta
	elif facing == "left":
		position.x -= attack_vel * delta
	
	timer += 100 * delta
	
	if timer >= lifetime:
		kill()
	


func kill():
	queue_free()
