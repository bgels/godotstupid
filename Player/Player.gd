extends CharacterBody2D

#Stats
@export var health = 100
@export var speed = 400
# Weapon
@export var BulletScene : PackedScene
var bulletOffset = 50


func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction.normalized() * speed
	if velocity == Vector2.ZERO:
		pass
	else:
		$AnimationTree.set("parameters/blend_position", velocity)
	if Input.is_action_just_pressed("shoot"):
		var pos = get_global_mouse_position()
		shoot(pos)
		#shoot()

func shoot(position_tar):
	var bullet = BulletScene.instantiate()
	owner.add_child(bullet)
	
	var startingPosition = position + (position_tar - position).normalized() * bulletOffset
	
	bullet.position = startingPosition
	bullet.direction = (position_tar - position).normalized()
	bullet.rotate_bullet()

func _physics_process(delta):
	get_input()
	move_and_slide()
	
# creates bullet, makes bullet travel in direction of cursor, removes bullet after traveling some distance, if bullet touches monster enemy
