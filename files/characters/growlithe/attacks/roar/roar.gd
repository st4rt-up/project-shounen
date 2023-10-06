extends Attack

@export var hitbox_manager : HitboxManager

func frame_0() -> void:
	sprite.play("start")
	hitbox_manager.change_to("start")
	
	if facing.x > 0: # facing right
		face_right()
	elif facing.x < 0: # facing left
		face_left()

func frame_1() -> void:
	return

func _physics_process(delta) -> void:
	advance_frame(delta)
	
func face_left() -> void:
	if sprite: sprite.flip_h = true
	if hitbox_manager: hitbox_manager.face_left()
	
func face_right() -> void:
	if sprite: sprite.flip_h = false
	if hitbox_manager: hitbox_manager.face_right()
