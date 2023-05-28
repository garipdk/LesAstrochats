extends Node2D


var initHealth = 100.0;

var _isSmall:bool = false

@export var health:float = 100.0
var _reward = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Minerals")
	pass # Replace with function boy.
	
func _initMineral(isSmall:bool, instanceInitHealth:float, reward: int):
	_isSmall = isSmall
	
	if isSmall:
		initHealth = instanceInitHealth
		get_node("BigMineral").queue_free()
		get_node("CollisionBig").queue_free()
	else:
		initHealth = instanceInitHealth
		get_node("SmallMineral").queue_free()
		get_node("CollisionSmall").queue_free()
		
	health = initHealth
	_reward = reward


func giveDamage(damage:float):
	health -= damage
	$HealthBar.setHealthVal(health / initHealth)
		
	if health <= 0:
		_destroy()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _destroy():
	if _isSmall:
		Global.score += _reward
	else:
		Global.score += _reward
	
	queue_free()
	
	pass


func _on_body_entered(body):
	if body.is_in_group("Chats"):
		body.on_entered_mineral(self)
		
	pass # Replace with function body.


func _on_body_exited(body):
	if body.is_in_group("Chats"):
		body.on_exited_mineral(self)
		
	pass # Replace with function body.
