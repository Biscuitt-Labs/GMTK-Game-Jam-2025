class_name MovementCommand
extends Command

@export var acceleration := 20.0       # How fast the car speeds up
@export var deceleration := 8.0        # How fast the car slows down when not accelerating
@export var max_speed := 30.0          # Max forward speed
@export var turn_speed := 2.5          # How fast the car turns
@export var gravity := 8.0           # Gravity pulling the car down
@export var grip := 0.1           # 0.2 = grippy, < 1 means less drift

#TODO could use an enum to represent ABS, LR string options as int, since string should only be 2 char long

class Params: 
	var deltaT: int
	var delta: float
	var speed: int
	var accelerate: bool
	var brake: bool
	var left: bool
	var right: bool
	
	func _init(dt: int, d: float, spd: int, a: bool, b: bool, l: bool, r: bool) -> void:
		self.deltaT = dt
		self.delta = d
		self.speed = spd
		self.accelerate = a
		self.brake = b
		self.left = l
		self.right = r
		
func execute (body: CharacterBody3D, data: Object = null):
	if data is Params: #placeholder
		print("data.speed: ", data.speed)
		
	 	## === Apply gravity ===
		body.velocity.y -= gravity * data.delta
		
		## === Handle forward/backward movement ===
		print("forward/ backward")
		if data.accelerate:
			data.speed += acceleration * data.delta
			print("a")
			print("speed: ", data.speed)
		elif data.brake:
			data.speed -= acceleration * data.speed
		else:
			# Natural deceleration when no input
			if data.speed > 0:
				data.speed = max(data.speed - deceleration * data.delta, 0)
				#print("speed: ", s)
			elif data.speed < 0:
				data.speed = min(data.speed + deceleration * data.delta, 0)
				#print("speed: ", s)
#
		# === Clamp to max speed ===
		#print("clamp")
		data.speed = clamp(data.speed, -max_speed * 0.5, max_speed)
		
		## === Handle turning (only when moving) ===
		#print("turn")
		if abs(data.speed) > 1.0: 
			if data.left: #if turn left
				body.rotation.y += turn_speed * data.delta * (data.speed / max_speed)
			elif data.right: #if turn right
				body.rotation.y -= turn_speed * data.delta * (data.speed / max_speed)
			
			#print("rotation y: ", data.rotation.y)
			
		## === Get movement direction based on car's facing ===
		
		var forward := -body.transform.basis.z
		var right := body.transform.basis.x
		
		## === Apply grip by damping sideways velocity ===
		#print("apply grip")
		# var forward_velocity := forward * data.speed
		forward *= data.speed
		var side_velocity := right * right.dot(body.velocity)
		
		## Final velocity = forward movement + reduced sideways drift 
		#print("final velocity")
		body.velocity.x = (forward + side_velocity * grip).x
		body.velocity.z = (forward + side_velocity * grip).z
		
		## === Call built-in movement function ===
		body.move_and_slide()
