extends CharacterBody2D

const WALK_SPEED: float = 300.0
const ACCELERATION: float = 12.0
const MIN_DASH_SPEED: float = 500.0
const MAX_DASH_SPEED: float = 1000.0
const JUMP_VELOCITY: float = -400.0

const WALK_ANIM_SPEED_SCALE: float = 3.0
const RUN_ANIM_SPEED_SCALE: float = 5.0

var speed: float = 0.0
var crouching: bool = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Increasing dash.
	if Input.is_action_pressed("dash") and is_on_floor():
		speed += ACCELERATION
		speed = clampf(speed, MIN_DASH_SPEED, MAX_DASH_SPEED)
	elif is_on_floor():
		speed -= ACCELERATION
		speed = clampf(speed, WALK_SPEED, MAX_DASH_SPEED)
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction: float = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	if velocity.x:
		$Sprite2D.play("walk")
	else:
		$Sprite2D.stop()
		$Sprite2D.frame = 0
		
	if velocity.x > 0:
		$Sprite2D.flip_h = false
	elif velocity.x < 0:
		$Sprite2D.flip_h = true
	 
	if speed >= MIN_DASH_SPEED:
		$Sprite2D.speed_scale = RUN_ANIM_SPEED_SCALE
	else:
		$Sprite2D.speed_scale = WALK_ANIM_SPEED_SCALE

	move_and_slide()

func _on_pickup_range_area_entered(area: Area2D) -> void:
	$"../GameManager".increase_score(area.value)
	area.queue_free() # FIXME: This will destroy any Area2D it touches, but it doesnt break anything atm so who gaf.
