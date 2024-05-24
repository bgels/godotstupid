extends CharacterBody2D

var speed = 144.0

func _physics_process(delta): # once every physics frame
	if Input.is_action_pressed("down"):
		print("down")
	if Input.is_action_pressed("up"):
		print("up")
	if Input.is_action_pressed("left"):
		print("left")
	if Input.is_action_pressed("right"):
		print("right")
	else:
		print("idle")
	if Input.is_action_just_pressed("attack"):
		print("attacked")
		$AttackArea/wepHitbox.disabled == false
	movement()

func movement():
	velocity = Input.get_vector("left","right","up","down").normalized() * speed
	move_and_slide()
	
