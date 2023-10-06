extends AnimatedSprite2D

var flicker_off_time: float = 0.1
var flicker_on_time: float = 0.3
var flicker_transparency: float = 0.2

var flicker_time: float = 0

func _ready() -> void:
	return
	
func flicker(time) -> void:
	var flicker_duration : float = flicker_off_time + flicker_on_time
	flicker_time = snapped( (time / flicker_duration) + flicker_duration, flicker_duration)
	
	var tween = create_tween()

	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_EXPO)
	
	for x in flicker_time:
		tween.tween_property(self, "modulate:a", flicker_transparency, flicker_off_time)
		tween.tween_property(self, "modulate:a", 1, flicker_on_time)

	# tween.kill()	
