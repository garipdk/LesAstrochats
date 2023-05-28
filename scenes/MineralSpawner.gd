extends Node2D

@export var spawnTimer:float = 1.0
@export var maxNumberOfMineral:int = 3

var numberOfMinerals:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _spawnMineral():
	
	var numberOfNodes = get_node("SpawnPosList").get_child_count()	
	var nodeNumber = int(randf() * numberOfNodes)
	
	if $Minerals.get_child_count() < maxNumberOfMineral:
	
		if get_node("Minerals/Mineral" + str(nodeNumber)) == null :
		
			var random = RandomNumberGenerator.new()
			random.randomize()
			var isBig:bool = randf() > .5
			
			var mineral = preload("res://scenes/Mineral.tscn")
			var newMineral = mineral.instantiate()
			newMineral._initMineral(isBig)
			
			var randomSpawner = get_node("SpawnPosList/SpawnPos" + str(nodeNumber))
			
			get_node("Minerals").add_child(newMineral)
			#$Minerals.add_child(newMineral)
			
			newMineral.position = randomSpawner.position;
			newMineral.name = "Mineral" + str(nodeNumber)

func _onTimeOut():
	_spawnMineral()
	
	pass


func _on_timer_ready():
	$Timer.wait_time = spawnTimer;
	pass # Replace with function body.
