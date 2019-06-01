extends "res://engine/entity.gd"

func _physics_process(delta):
	controls_loop()
	movement_loop()
	spritedir_loop(delta) 
	
	is_beer_picked_up()
	is_beer_left()
	is_beer_passed()
	if movedir != dir.center:
		if dir.holds_beer == false :
			animation_switch("walk")
		elif dir.is_beer_drinked == false:
			animation_switch("hold_beer")
			load_beer_scene()

	else:
		if dir.holds_beer == false :
			animation_switch("idle")
		elif dir.is_beer_drinked == false:
			animation_switch("idle_beer")
			load_beer_scene()
	is_beer_drinked(delta)


func is_beer_picked_up():
	if dir.is_in_beer_area == true:
		if Input.is_action_just_pressed("pink_up"):
			dir.holds_beer = true

func is_beer_left():
	if dir.holds_beer == true:
		if Input.is_action_just_pressed("leave_beer"):
			dir.holds_beer = false
			leave_beer()

func is_beer_passed():
	if dir.holds_beer == true:
		if Input.is_action_just_pressed("pass_beer"):
			if dir.passable == true:
				pass_beer()
			
func is_beer_drinked(delta):
	if dir.holds_beer == true:
		if Input.is_action_pressed("drink_beer"):
			dir.is_beer_drinked = true
			animation_switch("drink_beer")
			drink_beer(delta)
		else:
			dir.is_beer_drinked = false
			var current_beer = get_tree().get_nodes_in_group(str("beer", self)).back()
			current_beer.position = Vector2(0, -120)


func load_beer_scene():
	if dir.beer_loaded == false:
		match dir.beer_type:
			1:
				hold_beer(preload("res://beers/beer1.tscn"))
			2:
				hold_beer(preload("res://beers/beer2.tscn"))
			3:
				hold_beer(preload("res://beers/beer3.tscn"))
			4:
				hold_beer(preload("res://beers/beer4.tscn"))
		dir.beer_loaded = true

func controls_loop():
	var LEFT 	= Input.is_action_pressed("ui_left")
	var RIGHT	= Input.is_action_pressed("ui_right")
	var UP		= Input.is_action_pressed("ui_up")
	var DOWN	= Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	

	
	
	
	