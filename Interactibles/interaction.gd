extends Node2D

@export var message: String
@export var ui_layer: CanvasLayer
@export var interact_distance: float = 64.0

var player: Node2D
var can_interact: bool = false

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	print(player)
func _process(delta: float) -> void:
	if not player:
		print("player not found")
	
	var dist = global_position.distance_to(player.global_position)
	can_interact = dist <= interact_distance
	
	if can_interact and Input.is_action_just_pressed("interact"):
		ui_layer.show_message(message)
