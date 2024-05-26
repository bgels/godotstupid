# Main scene script (Main.gd) attached to the root node
extends Node2D

@onready var spawner = $monsterSpawn

func _ready():
	for i in range(5):  # spawn 5 monsters initially
		spawner.spawn_monster(Vector2(0,0))
