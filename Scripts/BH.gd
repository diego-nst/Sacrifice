extends Node2D
var player_units
var enemy_units

func _ready() -> void:
	player_units = $Units/PlayerUnits
	enemy_units = $Units/EnemyUnits
	
	for child in player_units.get_children():
		child.setDetails(child.name)
		child.get_child(1).play("Idle")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("KnightAttack"):
		pass
	if Input.is_action_just_pressed("YokaiAttack"):
		pass
		
