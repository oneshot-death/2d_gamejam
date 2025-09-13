extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animation:AnimationPlayer=$"../AnimationPlayer"


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction:Vector2=Vector2.ZERO
	direction.x=Input.get_action_strength("right")-Input.get_action_strength("left")
	direction.y=Input.get_action_strength("down")-Input.get_action_strength("up")	

func _ready() -> void:
	animation.play("idle")

	move_and_slide()
