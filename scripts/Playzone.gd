extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Playzone")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Chats"):
		body.on_entered_playzone()
	pass # Replace with function body.


func _on_body_exited(body):
	if body.is_in_group("Chats"):
		body.on_exited_playzone()
	pass # Replace with function body.
