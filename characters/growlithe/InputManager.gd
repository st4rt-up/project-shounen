extends Node

var input_vector
var player = 1

var left
var right
var up
var down
var attack_1
var attack_2
var attack_3

func _ready() -> void:
	match player:
		1:
			left = "p1_move_left"
			right = "p1_move_right"
			up = "p1_move_up"
			down = "p1_move_down"
			attack_1 = "p1_attack_1"
			attack_2 = "p1_attack_2"
			attack_3 = "p1_attack_3"
		2:
			left = "p2_move_left"
			right = "p2_move_right"
			up = "p2_move_up"
			down = "p2_move_down"
			attack_1 = "p2_attack_1"
			attack_2 = "p2_attack_2"
			attack_3 = "p2_attack_3"

func _process(_delta) -> void:
	input_vector = Input.get_vector(left, right, up, down).normalized()

func is_any_direction_pressed() -> bool:
	return sqrt(input_vector.x * input_vector.x + input_vector.y * input_vector.y) > 0
