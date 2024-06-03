extends Node2D

@export var demon : PackedScene
@onready var delay_timer = $DelayTimer
var enemyScene = [
	preload("res://Enemy/demon.tscn")
	]
func _ready(): 
	var timer = $CheckMonsterTimer
	timer.connect("timeout", Callable(self, "MonsterTimer_timeout"))
	timer.start()
# Function to spawn a new monster
func spawn_monster(x: Vector2):
	var selectedEnemy = randi_range(0, enemyScene.size() - 1)
	var demon1 = enemyScene[selectedEnemy].instantiate()
	demon1.position = x
	call_deferred('add_child', demon1)
	print("Spawning monster at position:", x)  # Debug position


func MonsterTimer_timeout():
	var amountMonster = get_tree().get_nodes_in_group("monster")
	print(amountMonster.size())
	if amountMonster.size() < 10:
		spawn_monster(Vector2(0,0))

