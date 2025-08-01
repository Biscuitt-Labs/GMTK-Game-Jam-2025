extends Area3D

# gets position of attached marker and returns it
func get_marker_position():
	var local_position = $marker.position # can change to *.global_position if buggy
	print("got local position: ", local_position)
	return local_position

# prints marker position to terminal for debugging
func _ready():
	print("_ready() marker position: ", get_marker_position())
