extends Node2D

@export var tilemap: TileMap
@export var player: Node2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse_click"):
		teleport_to_tile()

func teleport_to_tile() -> void:
	var mouse_pos_global = get_global_mouse_position()
	var mouse_pos_local = tilemap.to_local(mouse_pos_global)
	
	var tile_coords = tilemap.local_to_map(mouse_pos_local)
	var tile_pos_local = tilemap.map_to_local(tile_coords)
	var tile_pos_global = tilemap.to_global(tile_pos_local)
	
	var tile_size = tilemap.tile_set.tile_size
	var center_offset = tile_size / 2.0
	player.global_position = tile_pos_global + center_offset
