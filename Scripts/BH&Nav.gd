extends Node3D
var knight
var yokai

func _ready() -> void:
	knight = get_child(0).get_child(0)
	yokai = get_child(0).get_child(1)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("KnightAttack"):
		yokai.takeDamage(knight.attack)
	if Input.is_action_just_pressed("YokaiAttack"):
		knight.takeDamage(yokai.attack)
		
