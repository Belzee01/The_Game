extends Node

const TYPE_SCENE = "beer4"

var passed_to_client = false

const volume = 150
const price = 7

var current_beer_volume = volume

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_beer_4_area_body_entered(body):
	if body.is_in_group("player"):
		if dir.holds_beer == false:
			dir.holds_beer = true
			dir.beer_type = TYPE_SCENE