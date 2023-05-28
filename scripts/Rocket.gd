extends Node

var rocketState:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	rocketState = int((float(Global.score) / float(Global.scoreToWin)) * 4)
	
	_updateState()
	pass

func _updateState():
	$Rocket1.visible = rocketState == 0
	$Rocket2.visible = rocketState == 1
	$Rocket3.visible = rocketState == 2
	$Rocket4.visible = rocketState == 3
	pass
