extends Node

var _fillMax:int = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	_updateState()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_updateState()
	if Global.score >= _fillMax:
		get_parent().get_tree().change_scene_to_file("res://scenes/Win.tscn")
	pass

func _updateState():
	var scoreVal = clamp(Global.score, 0, _fillMax)
	$ProgressBar.value = float(scoreVal) / float(_fillMax) * 100
	$ProgressBar/RichTextLabel.text = str(scoreVal) + "/" + str(_fillMax)
	pass


