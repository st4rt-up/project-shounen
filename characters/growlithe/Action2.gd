extends State

@onready var sprite: AnimatedSprite2D = %sprite

func enter():
	frame_0()

func frame_0():
	owner.velocity.y = 0
	
	if owner.facing == "right":
		owner.velocity.x = 180
	elif owner.facing == "left":
		owner.velocity.x = -180	
	sprite.play("attack_phys")

func every_frame(delta):
	print(current_frame)
	owner.move_and_slide()

func frame_10():
	var attack1 = preload("res://characters/growlithe/attacks/attack_2.tscn")
	var instance = attack1.instantiate()
	
	var lifetime = 400
	instance.init(owner.facing)
	instance.position = owner.position
	add_child(instance) 

func frame_45():
	owner.velocity.x = 0
	owner.velocity.y = 0
	
	exit("Idle")

