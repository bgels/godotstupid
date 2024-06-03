extends Node2D

@onready var my_timer = $Timer

func _ready():
	for i in range(200):
		spawn_mob()
		
		
#func _ready():
	#my_timer.timeout.connect(_on_timer_timeout)
	#my_timer.wait_time = 3
	#my_timer.start()

var enemy_list = [
	preload("res://Enemy/demon.tscn"),
	preload("res://Enemy/skeleton(2).tscn") 
	]

func spawn_mob():
	var counter = 1
	var enemy_spawn = randf_range(0, enemy_list.size())
	var scene = enemy_list[enemy_spawn].instantiate()
	%PathFollow2D.progress_ratio = randf()
	scene.position = %PathFollow2D.global_position
	for i in range(counter):
		add_child(scene)

#func _process(delta: float):
	#if my_timer.time_left > 0:
		#spawn_mob()
#var new_mob = preload("res://Enemy/demon.tscn").instantiate() 
	#var new2_mob = preload ("res://Enemy/skeleton(2).tscn").instantiate()
	#%PathFollow2D.progress_ratio = randf()

#func _on_timer_timeout():
	#print("Timer has timed out!")
	#my_timer.stop()



	
