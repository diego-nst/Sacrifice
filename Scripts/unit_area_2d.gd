extends Area2D

@onready var player_units_handler = $"../.."
var hovering = false
var draw_border = false

func _draw():
	# Get the collision shape (assuming it's a RectangleShape2D)
	var collision_shape = $CollisionShape2D.shape as RectangleShape2D
	if collision_shape and draw_border:
		var extents = collision_shape.size
		var rect_size = extents
		var rect_pos = - (extents / 2)
		
		# Draw the rectangle (Color, Line Width, Filled)
		draw_rect(Rect2(rect_pos, rect_size), Color.RED, false, 2.0)

func _on_mouse_entered():
	hovering = true

func _on_mouse_exited():
	hovering = false

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and hovering:
		player_units_handler.select_unit(get_parent())
	elif event is InputEventMouseButton and event.is_pressed() and not hovering:
		draw_border = false
		queue_redraw()
	queue_redraw()
