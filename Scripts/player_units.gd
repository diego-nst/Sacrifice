extends Node2D

var selected_unit = null

func _ready() -> void:
	for child in get_children():
		pass

func select_unit(unit):
	if selected_unit != unit and selected_unit == null:
		selected_unit = unit
		selected_unit.selected = true
	elif selected_unit != unit and selected_unit:
		selected_unit.selected = false
		selected_unit = unit
		selected_unit.selected = true
	else:
		selected_unit.selected = false
		selected_unit = null
	#print(selected_unit.name)
	pass
