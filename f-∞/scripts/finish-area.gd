extends Area3D



func _on_body_entered(body: Node3D) -> void:
	if body.name == "test-vehicle-a":
		print("player entered finish area")
	#elif body is RigidBody3D: #for checking non-player objects
	#	print ("a rigidbody3d entered finish area: ", body.name)


func _on_body_exited(body: Node3D) -> void:
	if body.name == "test-vehicle-a":
		print("player exited finish area")
	# elif body is RigidBody3D: #for checking non-player objects
	#	print ("a rigidbody3d exited finish area: ", body.name)
