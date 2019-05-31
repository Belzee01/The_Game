extends KinematicBody2D

var random_wait

func _ready():
	random_wait = randi() % 20 + 1

func _process(delta):
	if dir.client_1_order == 0:
		if dir.client_1_timer > random_wait:
			dir.client_1_order = randi() % 4 + 1
			dir.client_1_timer = 0
	dir.client_1_timer += delta
	if dir.client_1_order != 0:
		match dir.client_1_order:
			1:
				display_beer_order(preload("res://clients/client_utils/client1.tscn"))
			2:
				display_beer_order(preload("res://clients/client_utils/client2.tscn"))
			3:
				display_beer_order(preload("res://clients/client_utils/client3.tscn"))
			4:
				display_beer_order(preload("res://clients/client_utils/client4.tscn"))	
	if dir.client_1_order == 0:
		beer_passed()
		
		
func beer_passed():
	if get_tree().get_nodes_in_group(str("beer_order_1", self)).size() > 0:
		var current_beer = get_tree().get_nodes_in_group(str("beer_order_1", self)).pop_front()
		remove_child(current_beer)
	
func display_beer_order(beer_order):
	var current_beer = beer_order.instance()
	current_beer.add_to_group(str("beer_order_1", self))
	add_child(current_beer)
	if get_tree().get_nodes_in_group(str("beer_order_1", self)).size() > 1:
		current_beer.queue_free()
	
