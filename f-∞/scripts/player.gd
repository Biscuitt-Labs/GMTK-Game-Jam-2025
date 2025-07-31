extends CharacterBody2D

@export var acceleration := 300.0
@export var max_speed := 600.0
@export var turn_speed := 3.0
#var velocity := Vector2.ZERO

func _physics_process(delta):
	# ROTATION
	if Input.is_action_pressed("ui_left"):
		rotation -= turn_speed * delta
		#print(rotation)
	elif Input.is_action_pressed("ui_right"):
		rotation += turn_speed * delta
		#print(rotation)
	
	# ACCELERATION / BRAKING
	if Input.is_action_pressed("ui_up"):
		velocity += Vector2.UP.rotated(rotation) * acceleration * delta
		#print(velocity)
	elif Input.is_action_pressed("ui_down"):
		velocity -= Vector2.UP.rotated(rotation) * acceleration * delta
		#print(velocity)
		
	# LIMIT SPEED
	if velocity.length() > max_speed:
		velocity = velocity.normalized() * max_speed
	
	#MOVE THE CAR
	move_and_slide()
