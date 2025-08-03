extends CharacterBody3D

var _controller: PlayerController

@onready var _controller_container = $ControllerContainer

func _ready() -> void:
	set_controller(HumanController.new(self))
	
func set_controller(controller: PlayerController) -> void:
	#delete prev controllers
	for child in _controller_container.get_children():
		child.queue_free()
		
	_controller = controller
	_controller_container.add_child(_controller)
	
	print("controller: ", _controller)
	print("controller_container: ", _controller_container)	
