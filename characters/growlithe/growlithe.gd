extends CharacterBody2D

var facing = "right"


func _on_area_2d_area_entered(area):
	print(str('Body entered: ', area.get_name()))
	pass # Replace with function body.
