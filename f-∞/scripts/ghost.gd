class_name Ghost
extends Player

func _ready() -> void:
	setController(AIController.new(self))

func setController(controller:Controller) -> void:
	# delete all previous controllers!
	for child in _controller_container.get_children():
		child.queue_free()
	
	_controller = controller
	_controller_container.add_child(_controller)