class_name MovementCommand
extends Command

class Params: 
	var input: Vector3
	
	func _init(vector: Vector3) -> void:
		self.input = vector
		
	func execute (body: RigidBody3D, data: Object = null) -> void:
		if data is Params:
			body.move(data)
