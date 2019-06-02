extends Node
export (PackedScene) var Rock
var Score

func _ready():
	randomize()
	
func _on_Menu_initgame():
	Score = 0
	$Player.initial($InitPosition.position)
	$InitialTimer.start()
	#$Menu.show_message("Ready")
	$Menu.update_score(Score)
	$TextureRect.show()
	$RockTimer.wait_time = .5
	
func _on_Player_collision():
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
	R.set_linear_velocity(Vector2(rand_range(R.speed_min, R.speed_max),0).rotated(d))
