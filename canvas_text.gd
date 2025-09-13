extends CanvasLayer

@onready var panel: Panel = $Panel
@onready var label: Label = $Panel/Label

func _ready() -> void:
	hide_message()

func show_message(text: String) -> void:
	label.text = text
	panel.visible = true

func hide_message() -> void:
	panel.visible = false
