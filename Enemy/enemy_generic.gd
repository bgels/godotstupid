extends CharacterBody2D

@export var speed = 45 # slider to the right

@onready var player = get_tree().get_first_node_in_group("player")

func _physics_process(_delta):
	velocity = global_position.direction_to(player.global_position).normalized() * speed
	move_and_slide()

