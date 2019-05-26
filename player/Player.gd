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
				hold_beer(preload("res://beers/beer1.tscn"))
				dir.beer_loaded = true
	else:
		if dir.holds_beer == false :
			animation_switch("idle")
		else:
			animation_switch("idle_beer")
			if dir.beer_loaded == false:
				hold_beer(preload("res://beers/beer1.tscn"))
				dir.beer_loaded = true


func controls_loop():
	var LEFT 	= Input.is_action_pressed("ui_left")
	var RIGHT	= Input.is_action_pressed("ui_right")
	var UP		= Input.is_action_pressed("ui_up")
	var DOWN	= Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	

	
	
	
	