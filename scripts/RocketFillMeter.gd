extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	_updateState()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_updateState()
	pass

func _updateState():
	var scoreVal = clamp(Global.score, 0, Global.scoreToWin)
	$ProgressBar.value = float(scoreVal) / float(Global.scoreToWin) * 100
	$ProgressBar/RichTextLabel.text = str(scoreVal) + "/" + str(Global.scoreToWin)
	pass


