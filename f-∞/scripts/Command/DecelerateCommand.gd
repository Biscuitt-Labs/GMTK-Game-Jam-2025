class_name DecelerateCommand
extends Command

func _init(src, tgt):
    super(src, tgt) #call parent constructor

func execute(delta: float):
    if target.speed > 0:
            target.speed = max(target.speed - target.deceleration * delta, 0)
            # print(speed)
    elif target.speed < 0:
            target.speed = min(target.speed + target.deceleration * delta, 0)
    # target.move_and_slide()
