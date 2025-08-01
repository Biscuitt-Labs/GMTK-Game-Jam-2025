extends Area3D

func _get_position():
	var local_position = $marker.position
	print("local position: ", local_position)

# 
func _ready():
	_get_position()
