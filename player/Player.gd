extends KinematicBody2D

const SPEED = 220

var movedir = Vector2(0, 0)
var spritedir = "_down"

func _physics_process(delta):
	controls_loop()
	movement_loop()
	spritedir_loop() 
	
	if is_on_wall():
		if spritedir == "_left" and test_move(transform, Vector2(-1, 0)):
			animation_switch("push")
		if spritedir == "_right" and test_move(transform, Vector2(1, 0)):
			animation_switch("push")
		if spritedir == "_down" and test_move(transform, Vector2(0, 1)):
			animation_switch("push")
		if spritedir == "_up" and test_move(transform, Vector2(0, -1)):
			animation_switch("push")
	elif movedir != Vector2(0, 0):
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
	
func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0, 0))
	
func spritedir_loop():
	match movedir:
		Vector2(-1, 0):
			spritedir = "_left"
		Vector2(1, 0):
			spritedir = "_right"
		Vector2(0, -1):
			spritedir = "_up"
		Vector2(0, 1):
			spritedir = "_down"
			
func animation_switch(animation):
	var new_animation = str(animation, spritedir)
	if $player_anim.current_animation!= new_animation:
		$player_anim.play(new_animation)
	
	
	
	
	