#class_name Player
#extends CharacterBody3D
#
#@export var acceleration := 20.0       # How fast the car speeds up
#@export var deceleration := 8.0        # How fast the car slows down when not accelerating
#@export var max_speed := 30.0          # Max forward speed
#@export var turn_speed := 2.5          # How fast the car turns
#@export var gravity := 8.0           # Gravity pulling the car down
#@export var grip := 0.1           # 0.2 = grippy, < 1 means less drift
#
#var speed := 0.0
#
#func _physics_process(delta):
	## === Apply gravity ===
	#velocity.y -= gravity * delta
	#
	## === Handle forward/backward movement ===
	#if Input.is_action_pressed("accelerate"):
		#speed += acceleration * delta
		#print("speed: ", speed)
	#elif Input.is_action_pressed("reverse"):
		#speed -= acceleration * delta
		#print("speed: ", speed)
	#else:
		## Natural deceleration when no input
		#if speed > 0:
			#speed = max(speed - deceleration * delta, 0)
			## print(speed)
		#elif speed < 0:
			#speed = min(speed + deceleration * delta, 0)
	#
	## === Clamp to max speed ===
	#speed = clamp(speed, -max_speed * 0.5, max_speed)	
	#
	## === Get movement direction based on car's facing ===
	#var forward := -transform.basis.z
	#
	## === Apply grip by damping sideways velocity ===
	#var forward_velocity := forward * speed
	#
	## Final velocity = forward movement + reduced sideways drift 
	## 0.2 = grippy, < 1 means less drift
	#velocity.x = (forward_velocity).x
	#velocity.z = (forward_velocity).z
	#
	#move_and_slide()
	
