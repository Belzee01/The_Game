extends Node

const volume = 80
const price = 5

var current_beer_volume = volume

func drink(delta) :
	current_beer_volume -= 3 * delta
	dir.alkoValue += 3 * delta
	
func reset():
	current_beer_volume = volume
	
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
