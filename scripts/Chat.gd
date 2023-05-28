extends CharacterBody2D

# Pickable needs to be selected from the inspector
@export var energy: float = 4.
@export var atack_points: float = 10.
@export var recuperation_per_second:float = 0.5
enum STATES {
	IDLE,
	SLEEP,
	DRAG,
	MINE,
	TIRED,
}
var etat: STATES = STATES.IDLE

var bed_pos:Vector2
var pick_up_pos:Vector2
var can_grab = false
var can_be_dropped = true
var grabbed_offset = Vector2()
var is_draged = false
var is_sleeping = false
var current_mineral = null
func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if Global.chat_draged == null:
			Global.chat_draged = self
		if Global.chat_draged == self:
			can_grab = event.pressed
			grabbed_offset = position - get_global_mouse_position()
	


func _process(_delta):
	$Lightning.visible = $Energy.value <= 0
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_grab:
		if Global.chat_draged == self:
			position = get_global_mouse_position() + grabbed_offset
			
			if is_draged == false:
				pick_up_pos = position
			
			is_draged = true
			etat = STATES.DRAG
	else:
		if current_mineral != null:
			etat = STATES.MINE
			if $Energy.value == 0.:
				etat = STATES.TIRED
		elif is_sleeping:
			etat = STATES.SLEEP
		else:
			etat = STATES.IDLE
		if Global.chat_draged == self:			
			if is_draged == true && can_be_dropped == false:
				position = pick_up_pos
				can_be_dropped = true
			Global.chat_draged = null
		is_draged = false
	
	# move_and_slide()
	
func on_entered_playzone():
	if etat == STATES.DRAG:
		can_be_dropped = true
		pass
	pass
	
	
	
func on_exited_playzone():
	if etat == STATES.DRAG:
		can_be_dropped = false
		pass
	pass

func on_entered_mineral(body):
	current_mineral = body

func on_exited_mineral(_body):
	current_mineral = null
	
func _on_timer_timeout():
	match etat:
		STATES.IDLE:
			pass
		STATES.DRAG:
			pass
		STATES.TIRED:
			pass
		STATES.MINE:
			if $Energy.value > 0.:
				current_mineral.giveDamage(atack_points)
			$Energy.value -= .5
		STATES.SLEEP:
			if bed_pos != null:
				position = bed_pos
			$Energy.value += recuperation_per_second


func on_sleepzone_entered(body):
	if body.is_in_group("SleepZone") and not Global.chat_sleeping:
		bed_pos = body.position;
		is_sleeping = true
		Global.chat_sleeping = true
	pass # Replace with function body.


func on_sleepzone_exited(body):
	if body.is_in_group("SleepZone") and is_sleeping:
		is_sleeping = false
		Global.chat_sleeping = false
	
func _on_energy_ready():
	$Energy.max_value = energy
	$Energy.value = energy
