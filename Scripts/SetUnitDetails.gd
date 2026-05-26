extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		child.setDetails(child.name)
		child.get_child(0).play("Idle")
