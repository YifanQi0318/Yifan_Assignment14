extends Control

var score_display


func _ready():
	$VBoxContainer/StartButton.grab_focus()
	
	

func _on_StartButton_pressed():
	get_tree().change_scene("res://World.tscn")


func _on_QuitButton_pressed():
	get_tree().change_scene("res://UI/Menu.tscn")
