extends FrameManager
class_name Attack

@export var sprite : AnimatedSprite2D
@export var hitbox_manager : HitboxManager
@export var path : StringName

# attack properties
var attack_effect : AttackEffectResource

var proj_owner : Node2D
var amt_hits : int = 1
var lifetime : int = 200 # in frames

var attack_vel : float = 0

var h_offset : int = 0
var v_offset : int = 0
var facing : Vector2

func _physics_process(delta) -> void:
	advance_frame(delta)

func _ready() -> void:
	if !sprite:
		print("Sprite is not set for " + self.name + "!")
	
	if facing.x > 0: # facing right
		position.x += h_offset
	elif facing.x < 0: # facing left
		position.x -= h_offset
	
	frame_0()
	
func face_right() -> void:
	facing.x = 1
	if sprite: sprite.flip_h = false
	if hitbox_manager: hitbox_manager.face_right()
	
func face_left() -> void:
	facing.x = -1
	if sprite: sprite.flip_h = true
	if hitbox_manager: hitbox_manager.face_left()
	
func flip() -> void:
	facing.x = -facing.x
	sprite.flip_h = !sprite.flip_h
	
func every_frame() -> void:	
	if facing:
		position += facing * attack_vel
	
	if current_frame >= lifetime:
		kill()

func init(dir) -> void:
	pass

func frame_0() -> void:
	pass

func kill() -> void:
	queue_free()
