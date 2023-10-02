extends Attack

@export var hitbox_manager : HitboxManager

func _ready() -> void:
	sprite.play()
	hitbox_manager.change_to("start")
	
	if !sprite:
		print("Sprite not set for flamethrower!")
	
	if facing_h == Vector2.RIGHT:
		face_right()
		position.x += h_offset
	elif facing_h == Vector2.LEFT:
		face_left()
		position.x -= h_offset
	elif facing:
		return
		
func _physics_process(delta) -> void:
	advance_frame(delta)
	
func face_left() -> void:
	if sprite: sprite.flip_h = true
	if hitbox_manager: hitbox_manager.face_left()
	
func face_right() -> void:
	if sprite: sprite.flip_h = false
	if hitbox_manager: hitbox_manager.face_right()
