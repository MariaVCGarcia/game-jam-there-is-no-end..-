class_name Player extends CharacterBody2D
 
var WALK_SPEED = 400.0
var  JUMP_SPEED = -400.0
var decceleration = 400
var acceleration = 400
var can_wall_jump: bool = true

func _physics_process(delta: float) -> void:
	Handle_gravity(delta)
	# Handle jump 
	handle_jump()
	#releases the jump allowing gravity to kick in
	handle_short_jump()
	#dubble jump 
	handle_dubble_jump()
	#fast fall 
	handle_fast_fall()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var Input_vector: Vector2 = Vector2.ZERO 
	Input_vector.x = Input.get_axis("left ", "right ")
	handle_move(Input_vector,delta)
	#wall kick
	hadle_wall_kick()
	move_and_slide()

func Handle_gravity(delta):
	if  not is_on_floor():
		velocity += get_gravity() * delta 

func handle_jump():
	if Input.is_action_just_pressed("up ") and is_on_floor():
		velocity.y = JUMP_SPEED

func handle_move(Input_vector: Vector2, delta: float)->void:
	if Input_vector.x !=0:
		if not is_on_floor():
			velocity.x = move_toward(velocity.x,WALK_SPEED * Input_vector.x, acceleration * delta)
		else:
			velocity.x = move_toward(velocity.x, WALK_SPEED * Input_vector.x, decceleration*delta)
	else:
		can_wall_jump = true
		velocity.x = move_toward(velocity.x,WALK_SPEED * Input_vector.x, decceleration*delta)

func handle_short_jump():
	if Input.is_action_just_released("up ") and not is_on_floor():
		velocity.y -= JUMP_SPEED *.3

func handle_dubble_jump():
	if Input.is_action_just_pressed("dubble_jump") and not is_on_floor():
		velocity.y = JUMP_SPEED

func handle_fast_fall():
	if Input.is_action_pressed("down") and not is_on_floor():
		velocity.y -= JUMP_SPEED *.1

func hadle_wall_kick():
	if can_wall_jump and Input.is_action_just_pressed("up ") and is_on_wall_only():
		var wall_normal: Vector2 = get_wall_normal()
		if wall_normal:
			can_wall_jump = false 
			velocity.x = wall_normal.x * acceleration
			velocity.y = JUMP_SPEED * 1.1
