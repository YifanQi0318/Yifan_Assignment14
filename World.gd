extends Node2D

const Player = preload("res://Player/Player.tscn")
const Monster = preload("res://Enemies/Bat.tscn")
const Exit = preload("res://World/ExitDoor.tscn")
const Bush = preload("res://World/Bush.tscn")
onready var _label = $Interface/Label
onready var _bar = $Interface/ExperienceBar


var borders = Rect2(2, 5, 21, 14)

onready var tileMap = $DirtCliffTileMap

func _ready():
	randomize()
	generate_level()
	

func generate_level():
	var walker = Walker.new(Vector2(12, 9), borders)
	var map = walker.walk(200)
	
	var player = Player.instance()
	add_child(player)
	player.position = map.front()*45
	
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
	exit.position = walker.get_end_room().position*60
	exit.connect("leaving_level", self, "reload_level")
	
	walker.queue_free()
	for location in map:
		tileMap.set_cellv(location, -1)
	tileMap.update_bitmask_region(borders.position, borders.end)

func reload_level():
	get_tree().reload_current_scene()

func _input(event):
	if event.is_action_pressed("Change"):
		reload_level()
	if not event.is_action_pressed('ExpChange'):
		return
	Player.gain_experience(34)
	_label.update_text(Player.level, Player.experience, Player.experience_required)


func _on_SpawnTimer_timeout():
	var monster = Monster.instance()
	add_child(monster)
	monster.position = $Spawner.position
	
	var area = $Spawner/SpawnArea
	var position = area.rect_position + Vector2(randf() * area.rect_size.x, randf() * area.rect_size.y)
	$Spawner.position = position
	

