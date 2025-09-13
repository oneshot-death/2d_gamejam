extends Node2D

@export var next_scene_path:String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if next_scene_path=='quit_game':
		get_tree().quit()
	else:
		
		get_tree().change_scene_to_file(next_scene_path)
