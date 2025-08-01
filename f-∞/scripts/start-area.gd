extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body.name == "test-vehicle-a":
		print("player entered start area")
	elif body is RigidBody3D:
		print ("a rigidbody3d entered start area: ", body.name)


func _on_body_exited(body: Node3D) -> void:
	if body.name == "test-vehicle-a":
		print("player exited start area")
	elif body is RigidBody3D:
		print ("a rigidbody3d exited start area: ", body.name)
