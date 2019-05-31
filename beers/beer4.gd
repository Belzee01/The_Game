extends Node

const TYPE_SCENE = 4

var passed_to_client = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_beer_4_area_body_entered(body):
	if body.is_in_group("player"):
		dir.is_in_beer_area = true
		if dir.holds_beer == false:
			dir.beer_type = TYPE_SCENE


func _on_beer_4_area_body_exited(body):
	dir.is_in_beer_area = false
