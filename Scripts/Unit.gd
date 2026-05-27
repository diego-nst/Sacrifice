extends Node2D
@onready var tilemap = $"../../../TileMapLayer"

var unitName
var health
var attack
var movement
@onready var grid_position: Vector2i = tilemap.map_to_local(position)
var current_path
var selected = false

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
	movement = db.UNITS[unit][2]
	print(unitName)
	print(health)
	print(attack)
	
func sacState():
	process_mode = Node.PROCESS_MODE_DISABLED
	hide()
	get_child(0).visible = false
	get_child(1).monitoring = false
	get_child(1).monitorable = false
	

func move(current_path: Array[Vector2i]):
	while not current_path.is_empty():
		var target_position = tilemap.map_to_local(current_path.front())
		await moveAnim(target_position)
		
		if(global_position == target_position):
			grid_position = current_path.front()
			current_path.pop_front()

func moveAnim(target):
	var tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", target, 0.1)
	await tween.finished

func _unhandled_input(event: InputEvent) -> void:
	var click_position = get_global_mouse_position()
	if event.is_action_pressed("moveTo"):
		if tilemap.is_point_movable(click_position) and not current_path and selected:
			current_path = tilemap.astar.get_id_path(tilemap.local_to_map(global_position), tilemap.local_to_map(click_position)).slice(1)
			move(current_path)
