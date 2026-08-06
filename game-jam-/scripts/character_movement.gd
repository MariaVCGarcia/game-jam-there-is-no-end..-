class_name Player extends CharacterBody2D
 

const SPEED = 400.0
const JUMP_VELOCITY = -400.0
const PUSH_BACK = 400
func _physics_process(delta: float) -> void:
	# Add the gravity
	if  not is_on_floor():
		velocity += get_gravity() * delta 
	# Handle jump 
	if Input.is_action_just_pressed("up ") and is_on_floor():
		velocity.y = JUMP_VELOCITY 
	#releases the jump allowing gravity to kick in
	if Input.is_action_just_released("up ") and not is_on_floor():
		velocity.y -= JUMP_VELOCITY *.3
	#dubble jump 
	if Input.is_action_just_pressed("dubble_jump") and not is_on_floor():
		velocity.y = JUMP_VELOCITY
	#fast fall 
	if Input.is_action_pressed("down") and not is_on_floor():
		velocity.y -= JUMP_VELOCITY *.1
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left ", "right ")
	if direction:
		if not is_on_floor():
			velocity.x = direction * (SPEED * .7)
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	#wall kick
	if Input.is_action_just_pressed("wall_kick") and is_on_wall():
		velocity.y = JUMP_VELOCITY
		velocity.x = direction * PUSH_BACK
	move_and_slide()
