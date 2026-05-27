extends Node2D

var selected_unit

func _unhandled_input(event: InputEvent) -> void:
	var click_position = get_global_mouse_position()
	if event is InputEventMouseButton :
		pass
