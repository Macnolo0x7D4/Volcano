extends CanvasLayer

signal initgame

func show_message(text):
	pass
	
func game_over():
	pass
	
func update_score(points):
	$Score.text = str(points)
	

func _on_Init_pressed():
	$Init.hide()
	$MenuImage.hide()
	
	emit_signal("initgame")
