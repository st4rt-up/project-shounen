extends BaseAttack

func init(dir):
	facing = dir
	
	attack_vel = 150
	lifetime = 200
	h_offset = 80

func on_run():
	anim.play("start")
	
func _on_anim_animation_finished():
	anim.play("loop")
