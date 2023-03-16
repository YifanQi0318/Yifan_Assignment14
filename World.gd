extends Node2D

const Player = preload("res://Player/Player.tscn")
const Monster = preload("res://Enemies/Bat.tscn")
const Exit = preload("res://World/ExitDoor.tscn")
const Bush = preload("res://World/Bush.tscn")


var borders = Rect2(1, 4, 22, 15)

onready var tileMap = $DirtCliffTileMap

func _ready():
	randomize()
	generate_level()

func generate_level():
	var walker = Walker.new(Vector2(11, 9), borders)
	var map = walker.walk(200)
	
	var player = Player.instance()
	add_child(player)
	player.position = map.front()*32
	
	var monster1 = Monster.instance()
	for n in 8:
	 add_child(monster1)
	 monster1.position = map.front()*20
	
	var bush = Bush.instance()
	for n in 8:
	 add_child(bush)
	 bush.position = map.front()*40
	
	
	
	
	var exit = Exit.instance()
	add_child(exit)
	exit.position = walker.get_end_room().position*32
	exit.connect("leaving_level", self, "reload_level")
	
	walker.queue_free()
	for location in map:
		tileMap.set_cellv(location, -1)
	tileMap.update_bitmask_region(borders.position, borders.end)

func reload_level():
	get_tree().reload_current_scene()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		reload_level()
