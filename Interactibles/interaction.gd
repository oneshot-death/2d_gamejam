extends Area2D

@export var message:String

var player_in_range:bool=false

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		player_in_range = true
		
func _on_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		player_in_range = false
		
func _process(delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("interact"):
		pass
