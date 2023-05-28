extends CharacterBody2D

# Pickable needs to be selected from the inspector
@export var energy: float = 4.
@export var atack_points: float = 10.
@export var recuperation_per_second:float = 0.5


var can_grab = false
var grabbed_offset = Vector2()
var is_draged = false
var current_mineral = null
func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		can_grab = event.pressed
		grabbed_offset = position - get_global_mouse_position()
	


func _process(_delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_grab:
		position = get_global_mouse_position() + grabbed_offset
		is_draged = true
	else:
		is_draged = false
	# move_and_slide()

func on_entered_mineral(body):
	current_mineral = body

func on_exited_mineral(_body):
	current_mineral = null
	
func _on_timer_timeout():
	if current_mineral != null and not is_draged:
		if $Energy.value > 0.:
			current_mineral.giveDamage(atack_points)
		$Energy.value -= 1.


func _on_energy_ready():
	$Energy.max_value = energy
	$Energy.value = energy
