extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus()

func _on_StartButton_pressed():
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_QuitButton_pressed():
	get_tree().quit()
	



func _on_FadeIn_fade_finished():
	$FadeIn.hide()
	get_tree().change_scene("res://World.tscn")
	
