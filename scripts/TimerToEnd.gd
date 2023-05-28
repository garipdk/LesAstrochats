extends Node

@export var _fillMax:int = 60

func _process(_delta):
	if _fillMax <= 0.:
		get_parent().get_tree().change_scene_to_file("res://scenes/Lose.tscn")

func _updateState():
	var leading_zero_min = ""
	var leading_zero_sec = ""
	if _fillMax/60 < 10:
		leading_zero_min = "0"
	if _fillMax%60 < 10:
		leading_zero_sec = "0"
	$RichTextLabel.text = leading_zero_min + str(_fillMax/60) + ":" + leading_zero_sec + str(_fillMax%60)  
	pass




func _on_rich_text_label_ready():
	_updateState()
	pass # Replace with function body.


func _on_timer_timeout():
	_fillMax-=1
	_updateState()
	pass # Replace with function body.
