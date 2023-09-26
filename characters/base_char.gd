extends Node

signal state_changed

var current_state = States.IDLE

enum States {
	IDLE,
	RUN,
	ATTACK,
	HURT
}

enum AttackStates {
	STARTUP,
	ACTIVE,
	RECOVERY,
	RECOVERY_CH
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func attack_1():
	pass

func attack_2():
	pass
	
func attack_3():
	pass
