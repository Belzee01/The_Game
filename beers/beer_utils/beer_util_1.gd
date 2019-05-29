extends Node

const volume = 100
const price = 3

var current_beer_volume = volume

func drink(delta) :
	current_beer_volume -= 3 * delta
	dir.alkoValue += 3 * delta
	print(dir.alkoValue)
	print(current_beer_volume)

func reset():
	current_beer_volume = volume

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
