extends Camera2D

@export var player_node: Node2D

func _process(delta: float) -> void:
	if is_instance_valid(player_node):
		global_position = player_node.global_position
