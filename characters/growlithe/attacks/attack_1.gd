extends BaseAttack

func init(dir):
	facing = dir
	
	lifetime = 50
	h_offset = 180

func on_run():
	anim.play("loop")
	



