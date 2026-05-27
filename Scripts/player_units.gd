extends Node2D

var selected_unit = null

func _ready() -> void:
	for child in get_children():
		pass

func redraw_border(unit, border):
	unit.get_child(0).draw_border = border
	unit.get_child(0).queue_redraw()

func select_unit(unit):
	if selected_unit != unit and selected_unit == null:
		selected_unit = unit
		selected_unit.selected = true
		redraw_border(selected_unit, true)
	elif selected_unit != unit and selected_unit:
		selected_unit.selected = false
		redraw_border(selected_unit, false)
		selected_unit = unit
		selected_unit.selected = true
		redraw_border(selected_unit, true)
	else:
		selected_unit.selected = false
		redraw_border(selected_unit, false)
		selected_unit = null
	#print(selected_unit.name)
	pass
