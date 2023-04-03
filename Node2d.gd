extends Node2D

func _ready():
	# Load the scene with the RichTextLabel node
	var timer_scene = load("res://UI/TimerCounter.tscn")
	
	# Instance the scene with the RichTextLabel node
	var timer_instance = timer_scene.instance()
	
	# Add the RichTextLabel node as a child of the Node2D node
	add_child(timer_instance)
