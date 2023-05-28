extends Node


var _fillValue:int = 0
var _fillMax:int = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _updateState():
	$ProgressBar.value = float(_fillValue) / float(_fillMax) * 100
	$ProgressBar/RichTextLabel.text = str(_fillValue) + "/" + str(_fillMax)
	pass
