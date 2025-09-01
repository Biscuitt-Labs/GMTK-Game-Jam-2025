class_name AccelerateCommand
extends Command

func _init(src, tgt):
    super(src, tgt) #call parent constructor

func execute(delta: float):
    # print("Moving towards %s!" % direction)
    target.speed += target.acceleration * delta
    print("speed: ", target.speed)
    # target.move_and_slide()
