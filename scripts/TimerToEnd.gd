extends Node

@export var _fillMax:int = 60


func _updateState():
	$RichTextLabel.text = "IL RESTE " + str(_fillMax) + " SECONDES"
	pass




func _on_rich_text_label_ready():
	_updateState()
	pass # Replace with function body.


func _on_timer_timeout():
	_fillMax-=1
	_updateState()
	pass # Replace with function body.
