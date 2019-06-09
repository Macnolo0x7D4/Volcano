extends Node
export (PackedScene) var Rock
var Score = 0
var last_score
var speed_max = 0
var speed_min = 0

func _ready():
	randomize()
func _process(delta):
	if  (Score + 1) % 5 == 0:
		speed_max += 2
		speed_min += 2
	if (Score + 1) % 10 == 0:
		if $RockTimer.wait_time > .5:
			$RockTimer.wait_time -= .25
		
func _on_Menu_initgame():
	last_score = Score
	Score = 0
	speed_max = 0
	speed_min = 0
	$Player.initial($InitPosition.position)
	$InitialTimer.start()
	#$Menu.show_message("Ready")
	$Menu.update_score(Score)
	$TextureRect.show()
	$RockTimer.wait_time = .5
	
func _on_Player_collision(): # Game Over
	$Menu.update_highscore(Score,last_score)
	last_score = Score
	$ScoreTimer.stop()
	$RockTimer.stop()
	$Menu.game_over()
	$TextureRect.hide()
	$Menu/MenuImage.show()
	$Menu/Init.show()

func _on_InitialTimer_timeout():
	$RockTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	Score += 1
	$Menu.update_score(Score)
		
func _on_RockTimer_timeout():
	$Path2D/PathFollow2D.set_offset(randi())
	
	var R = Rock.instance()
	add_child(R)
	
	var d = $Path2D/PathFollow2D.rotation + PI /2
	
	R.position = $Path2D/PathFollow2D.position
	
	d += rand_range(-PI /4, PI /4)
	R.rotation = d
	R.set_linear_velocity(Vector2(rand_range(R.speed_min + speed_min, R.speed_max + speed_max),0).rotated(d))
