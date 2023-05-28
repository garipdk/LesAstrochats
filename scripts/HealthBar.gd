extends Node2D

@export var health:float = 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	_updateState()
	pass # Replace with function body.


func setHealthVal(val):
	health = clampf(val, 0, 1)
	_updateState()
	pass

func _updateState():
	get_node("Anchor").scale.x = health;
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
