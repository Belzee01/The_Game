extends Node

const TYPE = 1

var passed_to_client = false

const volume = 100
const price = 3

var current_beer_volume = volume

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func drink(delta) :
	current_beer_volume -= 3 * delta

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		dir.holds_beer = true