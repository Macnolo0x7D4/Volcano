extends CanvasLayer
var _is_init = 0
signal initgame

func _ready():
	$Message.hide()
func _process(delta):
	if Input.is_action_pressed("ui_select") && _is_init == 0:
		_on_Init_pressed()
	#if Input.is_action_pressed("ui_cancel"):
		#if get_tree().paused == true
func show_message(text):
	$Message.text = text
	$Message.show()
	
func game_over():
	#show_message("Game Over")
	_is_init = 0
	
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
	_is_init = 1
	emit_signal("initgame")
