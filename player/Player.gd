extends "res://engine/entity.gd"

func _physics_process(delta):
	controls_loop()
	movement_loop()
	spritedir_loop() 
	
	if is_on_wall():
		if spritedir == "_left" and test_move(transform, dir.left):
			animation_switch("push")
		if spritedir == "_right" and test_move(transform, dir.right):
			animation_switch("push")
		if spritedir == "_down" and test_move(transform, dir.down):
			animation_switch("push")
		if spritedir == "_up" and test_move(transform, dir.up):
			animation_switch("push")
	elif movedir != dir.center:
		animation_switch("walk")
	else:
		animation_switch("idle")

func controls_loop():
	var LEFT 	= Input.is_action_pressed("ui_left")
	var RIGHT	= Input.is_action_pressed("ui_right")
	var UP		= Input.is_action_pressed("ui_up")
	var DOWN	= Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	

	
	
	
	