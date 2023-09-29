extends State

@onready var sprite: AnimatedSprite2D = %sprite

func enter():
	frame_0()

func frame_0():
	owner.velocity.x = 0
	owner.velocity.y = 0
	
	sprite.play("attack_spec")

func every_frame(delta):
	print(current_frame)
	owner.move_and_slide()

func frame_10():
	var attack1 = preload("res://characters/growlithe/attacks/attack_1.tscn")
	var instance = attack1.instantiate()
	
	var lifetime = 400
	instance.init(owner.facing)
	instance.position = owner.position
	add_child(instance) 

func frame_45():
	owner.velocity.x = 0
	owner.velocity.y = 0
	
	exit("Idle")

