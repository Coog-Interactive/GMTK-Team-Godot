extends CharacterBody2D

const WALK_SPEED: float = 300.0
const DASH_SPEED: float = 500.0
const JUMP_VELOCITY: float = -400.0

var speed: float = 0.0
var crouching: bool = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Handle dash.
	if Input.is_action_pressed("dash") and is_on_floor():
		speed = DASH_SPEED
	elif is_on_floor():
		speed = WALK_SPEED

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction: float = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
