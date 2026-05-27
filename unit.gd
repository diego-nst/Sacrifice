extends Node2D
@onready var tilemap = $"../../../TileMapLayer"
var current_path: Array[Vector2i]

var unitName
var health
var attack

func takeDamage(dmg):
	health -= dmg
	print(unitName)
	print(health)
	if health <= 0:
		sacState()

func setDetails(unit):
	var db = preload("res://Scripts/UnitDatabase.gd")
	unitName = unit
	health = db.UNITS[unit][0]
	attack = db.UNITS[unit][1]
	print(unitName)
	print(health)
	print(attack)
	
func sacState():
	process_mode = Node.PROCESS_MODE_DISABLED
	hide()
	get_child(0).visible = false
	get_child(1).monitoring = false
	get_child(1).monitorable = false
	

func _process(delta):
	if current_path.is_empty():
		return
	var target_position = tilemap.map_to_local(current_path.front())
	global_position = global_position.move_toward(target_position, 5)
	
	if(global_position == target_position):
		current_path.pop_front()

func _unhandled_input(event: InputEvent) -> void:
	var click_position = get_global_mouse_position()
	if event.is_action_pressed("moveTo"):
		if tilemap.is_point_movable(click_position):
			current_path = tilemap.astar.get_id_path(tilemap.local_to_map(global_position), tilemap.local_to_map(click_position)).slice(1)
			
