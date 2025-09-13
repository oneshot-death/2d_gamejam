extends Node2D

@export var message: String
@export var ui_layer: CanvasLayer

var player_in_range: bool = false

func _ready() -> void:
	$Area2D.connect("body_entered", Callable(self, "_on_body_entered"))
	$Area2D.connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body: Node) -> void:
	print(body.name)
	player_in_range = true
	if has_node("Sprite2D"):
		$Sprite2D.modulate = Color(1, 1, 1)

func _on_body_exited(body: Node) -> void:
	ui_layer.hide_message()
	if body.is_in_group("player"):
		player_in_range = false
		if has_node("Sprite2D"):
			$Sprite2D.modulate = Color(0.6, 0.6, 0.6)

func _process(delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("interact"):
		ui_layer.show_message(message)
