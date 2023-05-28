extends Node2D


@export var scoreToWin: int = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.chat_sleeping = false
	Global.score = 0
	Global.chat_draged = null
	Global.scoreToWin = scoreToWin
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.score >= Global.scoreToWin:
		get_tree().change_scene_to_file("res://scenes/Win.tscn")
	pass
