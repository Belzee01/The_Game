extends Node

const TYPE_SCENE = "beer2"

var passed_to_client = false

const volume = 120
const price = 5

var current_beer_volume = volume

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_beer_2_area_body_entered(body):
	if body.is_in_group("player"):
		dir.is_in_beer_area = true
		dir.beer_type = TYPE_SCENE


func _on_beer_2_area_body_exited(body):
	dir.is_in_beer_area = false
