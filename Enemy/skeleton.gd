extends CharacterBody2D

#stats
@export var speed = 80 # slider to the right
@export var health = 100
@onready var player = get_tree().get_first_node_in_group("player")
@onready var spawner = get_parent()

func _physics_process(_delta):
	velocity = global_position.direction_to(player.global_position).normalized() * speed
	move_and_slide()

func take_damage(amount):
	health -= amount
	if health <= 0:
		die()
		print("Skeleton dead")
		queue_free()

func die():
	print("respawning skele")
	queue_free()
