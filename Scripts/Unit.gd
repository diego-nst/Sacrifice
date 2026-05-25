extends Node3D
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
