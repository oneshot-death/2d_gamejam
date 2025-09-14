extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -350.0

@onready var animation: AnimationPlayer = $"../AnimationPlayer"

func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement input
	var direction: Vector2 = Vector2.ZERO
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")

	# Apply horizontal movement
	velocity.x = direction.x * SPEED

	# Apply movement each frame
	move_and_slide()

func _ready() -> void:
	animation.play("idle")
