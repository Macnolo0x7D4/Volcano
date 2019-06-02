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
	
func new_speed(minim , maxim):
	speed_max = maxim
	speed_min = minim
