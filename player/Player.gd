extends "res://engine/entity.gd"

func _physics_process(delta):
	controls_loop()
	movement_loop()
	spritedir_loop(delta) 
	
	if movedir != dir.center:
		if dir.holds_beer == false :
			animation_switch("walk")
		else:
			animation_switch("hold_beer")
			if dir.beer_loaded == false:
				load_beer_scene()
				dir.beer_loaded = true
	else:
		if dir.holds_beer == false :
			animation_switch("idle")
		else:
			animation_switch("idle_beer")
			if dir.beer_loaded == false:
				load_beer_scene()
				dir.beer_loaded = true

func load_beer_scene():
	match dir.beer_type:
		"beer1":
			hold_beer(preload("res://beers/beer1.tscn"))
		"beer2":
			hold_beer(preload("res://beers/beer2.tscn"))
		"beer3":
			hold_beer(preload("res://beers/beer3.tscn"))
		"beer4":
			hold_beer(preload("res://beers/beer4.tscn"))

func controls_loop():
	var LEFT 	= Input.is_action_pressed("ui_left")
	var RIGHT	= Input.is_action_pressed("ui_right")
	var UP		= Input.is_action_pressed("ui_up")
	var DOWN	= Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	

	
	
	
	