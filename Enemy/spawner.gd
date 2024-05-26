extends Node2D

@export var demon : PackedScene

# Function to spawn a new monster
func spawn_monster(position: Vector2):
	var demon = demon.instantiate()
	demon.position = position
	add_child(demon)
	print("Spawning monster at position:", position)  # Debug position
