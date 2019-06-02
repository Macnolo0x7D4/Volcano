extends Area2D

export (int) var speed
var move = Vector2()
var limit
signal collision

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	limit = get_viewport_rect().size
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		move.x += 1
		$Sprite.playing = true
	if Input.is_action_pressed("ui_left"):
		move.x -=1
		$Sprite.playing = true
		
	if (move.length() > 0): #Normalizing speed
		move = move.normalized() * speed
	
	position += move * delta
	position.x = clamp(position.x, 0, limit.x)
	
	if move.x != 0:
		$Sprite.flip_h = move.x < 0
		if move.x < 0:
			$CollisionShape.position.x = 20
		else:
			$CollisionShape.position.x = -20
	else:
		$Sprite.playing = false

func _on_Player_body_entered(body):
	hide()
	emit_signal("collision")
	$CollisionShape.disabled = true
	
func initial(pos):
	position = pos
	show()
	$CollisionShape.disabled = false
	
