extends Control

var selecting: bool = false
var mouse_pos: Vector2

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			selecting = true
			var mouse_pos = event.position
		else:
			selecting = false
			update_selected_unit()
			queue_redraw()
			
func _draw() -> void:
	if not selecting: return

func update_selected_unit():
	for unit in get_tree():
		get_nodes_in_group('unit')
