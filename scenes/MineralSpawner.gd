extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _spawnMineral():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var isBig:bool = randf() > .5
	
	var mineral = preload("res://scenes/Mineral.tscn")
	var newMineral = mineral.instantiate()
	add_child(newMineral)
	
	#var numberOfNodes = get_node("Area2D/SpawnPosList").get_child_count()
	#var randomSpawner = get_node("Area2D/ItemList/SpawnPos" + str(int(randf() * numberOfNodes)))
	
	
	#newMineral.position = randomSpawner.position

func _onTimeOut():
	_spawnMineral()
	
	pass
