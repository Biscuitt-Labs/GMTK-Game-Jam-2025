class_name RightCommand
extends Command

func _init(src, tgt):
	super(src, tgt) #call parent constructor

func execute(delta: float):
	#print("Moving towards %s!" % direction)
	target.rotation.y -= target.turn_speed * delta * (target.speed / target.max_speed)
	print("rotation", target.rotation.y)
	target.move_and_slide()
