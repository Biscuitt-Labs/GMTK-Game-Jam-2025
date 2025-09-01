class_name Player
extends CharacterBody3D

@export var acceleration := 20.0       # How fast the car speeds up
@export var deceleration := 8.0        # How fast the car slows down when not accelerating
@export var max_speed := 30.0          # Max forward speed
@export var turn_speed := 2.5          # How fast the car turns
@export var gravity := 8.0           # Gravity pulling the car down
@export var grip := 0.1           # 0.2 = grippy, < 1 means less drift

@onready var _controller_container = $ControllerContainer
@onready var _controller: Controller

@export var speed := 0.0   # Current forward/backward speed

func _ready() -> void:
	setController(Controller.new(self))

func setController(controller:Controller) -> void:
	#delete all previous controllers
	for child in _controller_container.get_children():
		child.queue_free()
	
	_controller = controller
	_controller_container.add_child(_controller)
