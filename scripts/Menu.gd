extends CanvasLayer

signal initgame

func show_message(text):
	pass
	
func game_over():
	pass
	
func update_score(points):
	$Score.text = str(points)
	
func update_highscore(score,last_score):
	#$HighScore.text = str(last_score)
	if last_score == null:
		last_score = 0
	if score > last_score:
		if int($HighScore.text) < score:
			$HighScore.text = str(score)
func _on_Init_pressed():
	$Init.hide()
	$MenuImage.hide()
	
	emit_signal("initgame")
