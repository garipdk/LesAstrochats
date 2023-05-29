extends Node2D

var animtreeready:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_tree_ready():
	animtreeready = true
	pass # Replace with function body.
func show_anim(name0):
	for c in get_children():
		if c.is_in_group("Sprites"):
			if name0 != c.name:
				c.visible = false
			else:
				c.visible = true
				if name0 == "SLEEP":
					c.rotation = 90
				else:
					c.rotation = 0
