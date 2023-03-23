extends KinematicBody2D

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")

const MAX_DISTANCE_TO_PLAYER: int = 80
const MIN_DISTANCE_TO_PLAYER: int = 40

onready var sprite = $AnimatedSprite
