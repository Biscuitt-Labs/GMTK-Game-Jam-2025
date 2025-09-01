class_name AIController
extends Controller

func _init(p: Player) -> void:
    super(p)

func _physics_process(delta: float) -> void:
    # === Apply gravity ===
    player.velocity.y -= player.gravity * delta

    ## === Handle forward/backward movement ===
    if Input.is_action_pressed("accelerate"):
        accelCommand.execute(delta)
        print(player.speed)
    elif Input.is_action_pressed("reverse"):
        reverseCommand.execute(delta)
        print(player.speed)
    else:
        decelCommand.execute(delta) #TODO does this need to be a command?
        print(player.speed)
        
    # === Clamp to max speed ===
    player.speed = clamp(player.speed, -player.max_speed * 0.5, player.max_speed)
        
    # === Handle turning (only when moving) ===
    if abs(player.speed) > 1.0: 
        if Input.is_action_pressed("turn left"):
            leftCommand.execute(delta)
            ##print(rotation.y)
        elif Input.is_action_pressed("turn right"):
            rightCommand.execute(delta)
            ##print(rotation.y)

    # === Get movement direction based on car's facing ===
    var forward := -player.transform.basis.z
    var right := player.transform.basis.x

    # === Apply grip by damping sideways velocity ===
    var forward_velocity := forward * player.speed
    var side_velocity := right * right.dot(player.velocity)

    # Final velocity = forward movement + reduced sideways drift 
    # 0.2 = grippy, < 1 means less drift
    player.velocity.x = (forward_velocity + side_velocity * player.grip).x
    player.velocity.z = (forward_velocity + side_velocity * player.grip).z

    player.move_and_slide()
