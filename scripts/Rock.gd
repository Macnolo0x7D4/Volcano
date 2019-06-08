extends RigidBody2D

export (int) var speed_min
export (int) var speed_max

#var type = ["eli","sph","prb"]
func _ready():
	#$AnimatedSprite.animation = type[randi() % type.size()]
	#$AnimatedSprite.animation = "default"
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func set_angle(angle):
	#$CPUParticles2D.gravity.y = gravity
	pass