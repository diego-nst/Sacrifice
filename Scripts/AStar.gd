extends Node3D

var gridStep := 1.0
var gridY := 0.5
var points := {}
var astar = AStar3D.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var pathables = get_tree().get_nodes_in_group("pathable")
	_addPoints(pathables)
	_connectPoints()

func _addPoints(pathables: Array):
	for pathable in pathables:
		var mesh = pathable.get_node("Plane")
		var aabb: AABB = mesh.get_aabb()
		
		var firstPoint = aabb.position
		
		var xSteps = aabb.size.x/gridStep
		var zSteps = aabb.size.z/gridStep
		
		for x in xSteps:
			for z in zSteps:
				var nextPoint = firstPoint + Vector3(x * gridStep, 0, z * gridStep)
				_addPoint(nextPoint)
	
func _addPoint(point: Vector3):
	point.y = gridY
	
	var id = astar.get_available_point_id()
	
	astar.add_point(id, point)
	points[worldToAStar(point)] = id
	
func _connectPoints():
	for point in points:
		var posStr = point.split(",")
		var worldPos := Vector3(posStr[0], posStr[1], posStr[2])
	
func findPath(from: Vector3, to: Vector3) -> Array:
	return []

func worldToAStar(worldPoint: Vector3) -> String:
	var x = snapped(worldPoint.x, gridStep)
	var y = snapped(worldPoint.y, gridStep)
	var z = snapped(worldPoint.z, gridStep)
	
	return "%d,%d,%d" % [x, y, z]
