extends Area2D

@onready var player_units_handler = $"../.."
var hovering = false

func _on_mouse_entered():
	hovering = true

func _on_mouse_exited():
	hovering = false

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and hovering:
		player_units_handler.select_unit(get_parent())
