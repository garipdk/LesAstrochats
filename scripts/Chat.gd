extends CharacterBody2D

# Pickable needs to be selected from the inspector
@export var energy: int = 4

var can_grab = false
var grabbed_offset = Vector2()

var is_draged = false

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		can_grab = event.pressed
		grabbed_offset = position - get_global_mouse_position()

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_grab:
		position = get_global_mouse_position() + grabbed_offset
		is_draged = true
	else:
		is_draged = false
		


func _on_timer_timeout():
	$Energy.value-=1
	pass # Replace with function body.


func _on_energy_ready():
	$Energy.max_value = energy
	$Energy.value = energy
	pass # Replace with function body.
