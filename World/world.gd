# Main scene script (Main.gd) attached to the root node
extends Node2D

@onready var my_timer = $Timer

func _ready():
	for i in range(10):
		spawn_mob()
		
#func _on_timer_timeout():
	#spawn_mob()
var enemy_list = [
	preload("res://Enemy/normalMobs/demon.tscn"),
	preload("res://Enemy/normalMobs/skeleton.tscn"),
	preload("res://Enemy/boss/boss.tscn")
	]

func spawn_mob():
	var counter = 1
	var enemy_spawn = randf_range(0, enemy_list.size())
	var scene = enemy_list[enemy_spawn].instantiate()
	%PathFollow2D.progress_ratio = randf()
	scene.position = %PathFollow2D.global_position
	for i in range(counter):
		add_child(scene)

#func _ready():
	#spawnerCall()
#func spawnerCall():
	#var rng = RandomNumberGenerator.new()
	#rng.randomize()
	#$Player/Path2D/PathFollow2D.offset = rng.randi_range(0, 2600)
	
	#var currentPos = $Player/Path2D/PathFollow2D/Marker2D.global_position
	#spawner.spawn_monsterDemon(currentPos)


	

