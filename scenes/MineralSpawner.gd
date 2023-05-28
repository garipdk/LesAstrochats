extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _spawnMineral():
	
	var numberOfNodes = get_node("SpawnPosList").get_child_count()	
	var nodeNumber = int(randf() * numberOfNodes)
	
	if get_node("Mineral" + str(nodeNumber)) == null :
	
		var random = RandomNumberGenerator.new()
		random.randomize()
		var isBig:bool = randf() > .5
		
		var mineral = preload("res://scenes/Mineral.tscn")
		var newMineral = mineral.instantiate()
		newMineral._initMineral(isBig)
		add_child(newMineral)
		
		var randomSpawner = get_node("SpawnPosList/SpawnPos" + str(nodeNumber))
		
		
		newMineral.position = randomSpawner.position;
		newMineral.name = "Mineral" + str(nodeNumber)

func _onTimeOut():
	_spawnMineral()
	
	pass
