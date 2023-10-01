extends FrameManager
class_name Attack

@export var sprite : AnimatedSprite2D

# attack properties
var attack_damage : int = 1
var knockback_force : int = 0
var hitstun : int = 0

var lifetime : int = 200

var attack_vel : float = 0
var h_offset : int = 0
var v_offset : int = 0
var facing_h : Vector2 = Vector2.RIGHT

func _ready():
	if facing_h == Vector2.RIGHT:
		position.x += h_offset
	elif facing_h == Vector2.LEFT:
		position.x -= h_offset
	
	frame_0()
	
func face_right() -> void:
	facing_h = Vector2.RIGHT
	sprite.flip_h = false
	

func face_left() -> void:
	facing_h = Vector2.LEFT
	sprite.flip_h = true

func every_frame():	
	owner.velocity = facing_h * attack_vel
	owner.move_and_slide()
	
	if current_frame >= lifetime:
		kill()

func init(dir):
	pass

func frame_0():
	pass

func kill():
	queue_free()
