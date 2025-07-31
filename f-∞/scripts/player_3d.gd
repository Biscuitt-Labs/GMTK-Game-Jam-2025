extends CharacterBody3D

@export var acceleration := 10.0
@export var max_speed := 20.0
@export var turn_speed := 2.0

func _physics_process(delta):
	# ROTATION
	if Input.is_action_pressed("ui_left"):
		rotation.y -= turn_speed * delta
		#print(rotation)
	elif Input.is_action_pressed("ui_right"):
		rotation.y += turn_speed * delta
		#print(rotation)
	
	# ACCELERATION / BRAKING
	if Input.is_action_pressed("ui_up"):
		velocity += -transform.basis.z * acceleration * delta
		#print(velocity)
	elif Input.is_action_pressed("ui_down"):
		velocity += transform.basis.z * acceleration * delta
		#print(velocity)
		
	# LIMIT SPEED
	if velocity.length() > max_speed:
		velocity = velocity.normalized() * max_speed
	
	#MOVE THE CAR
	move_and_slide()
