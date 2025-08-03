class_name AiController
extends PlayerController

var _init_time: int = 0

func _ready():
	_init_time = Time.get_ticks_msec()
	
func _physics_process(delta):
	# get the current time of the tick
	var current_time = Time.get_ticks_msec() - _init_time
