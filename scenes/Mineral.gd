extends Node2D

@export var health:float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func giveDamage(damage:float):
	health -= damage
	$HealthBar.setHealthVal(health / 100.0)
		
	if health <= 0:
		_destroy()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _destroy():
	queue_free()
	pass
