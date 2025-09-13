extends Node2D

@export var player: Node2D
@onready var camera:Camera2D=$Player/Camera2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse_click"):
		teleport_to_mouse()

func teleport_to_mouse() -> void:
	var mouse_pos_global = get_global_mouse_position()
	player.global_position = mouse_pos_global
