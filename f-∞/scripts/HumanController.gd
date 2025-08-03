class_name HumanController
extends PlayerController

@export var acceleration := 20.0       # How fast the car speeds up
@export var deceleration := 8.0        # How fast the car slows down when not accelerating
@export var max_speed := 30.0          # Max forward speed
@export var turn_speed := 2.5          # How fast the car turns
@export var gravity := 8.0           # Gravity pulling the car down
@export var grip := 0.1           # 0.2 = grippy, < 1 means less drift

var _init_time: int = 0
var speed := 0        # starting speed

func _ready():
	_init_time = Time.get_ticks_usec()
	
func _physics_process(delta):
	# get the current time of the tick
	var deltaT = Time.get_ticks_usec() - _init_time
	var accelerate = false
	var brake = false
	var left = false
	var right = false
	
	## === Handle forward/backward movement ===
	if Input.is_action_pressed("accelerate"):
		accelerate= true
	elif Input.is_action_pressed("reverse"):
		brake = true
		
	# === Handle turning (only when moving) ===
	if Input.is_action_pressed("turn left"):
			left = true
	elif Input.is_action_pressed("turn right"):
			right = true
	
	# === Movement Command === #
	movement_command.execute(body, MovementCommand.Params.new(deltaT, delta, speed, accelerate, brake, left, right))
	body.move_and_slide()
	
	
	
	


	
