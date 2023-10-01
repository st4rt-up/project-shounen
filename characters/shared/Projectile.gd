extends FrameManager
class_name Projectile

var vel: float = 0.0
var dir: Vector2

func every_frame(delta):
	if vel != 0:
		var h_vel:float = vel * dir.x
		var y_vel:float = vel * dir.y
		
		owner.position.x += h_vel
		owner.position.y += y_vel

func kill():
	queue_free()
