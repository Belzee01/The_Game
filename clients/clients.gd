extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_client1_area_body_entered(body):
	if body.is_in_group("player"):
		dir.which_in_client_area = 1
		if dir.beer_type == dir.client_1_order:
			dir.passable = true


func _on_client2_area_body_entered(body):
	if body.is_in_group("player"):
		dir.which_in_client_area = 2
		if dir.beer_type == dir.client_2_order:
			dir.passable = true

func _on_client3_area_body_entered(body):
	if body.is_in_group("player"):
		dir.which_in_client_area = 3
		if dir.beer_type == dir.client_3_order:
			dir.passable = true


func _on_client4_area_body_entered(body):
	if body.is_in_group("player"):
		dir.which_in_client_area = 4
		if dir.beer_type == dir.client_4_order:
			dir.passable = true
			


func _on_client4_area_body_exited(body):
	dir.which_in_client_area = 0
	dir.passable = false


func _on_client3_area_body_exited(body):
	dir.which_in_client_area = 0
	dir.passable = false


func _on_client2_area_body_exited(body):
	dir.which_in_client_area = 0
	dir.passable = false


func _on_client1_area_body_exited(body):
	dir.which_in_client_area = 0
	dir.passable = false