extends KinematicBody2D


var SPEED = 220

const MAX_SPEED = 500

var accelerationHorizontal = 0
var accelerationVertical = 0
const accelerationBase = 0.8

var movedir = dir.center
var spritedir = "_right"

var timer = 0.0
var alkoTimer = 0.0
var alkoValue = 200.0

func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, dir.center)
	
func spritedir_loop(delta):
	match movedir:
		dir.left:
			spritedir = "_left"
			accelerationHorizontal = -alkoValue*accelerationBase
		dir.right:
			spritedir = "_right"
			accelerationHorizontal = alkoValue*accelerationBase
		dir.up:
			spritedir = "_left"
			accelerationVertical = -alkoValue*accelerationBase
		dir.down:
			spritedir = "_right"
			accelerationVertical = alkoValue*accelerationBase
	
	timer += delta
	process_horizontal_slide()
	process_vertical_slide()
	process_alko_meter_value(delta)

	position.x = lerp(position.x, position.x + accelerationHorizontal, delta)
	position.y = lerp(position.y, position.y + accelerationVertical, delta)
			
			
func process_alko_meter_value(delta):
	if alkoValue < 0.0:
		alkoValue = 0.0
	alkoTimer += delta
	if alkoTimer >= 0.3:
		alkoTimer = 0.0
		alkoValue -= 1
	SPEED = 1.7* alkoValue
	SPEED = clamp(SPEED, 100, MAX_SPEED)
			
func process_vertical_slide():
	if accelerationVertical > 0.0:
		accelerationVertical -= timer
		if accelerationVertical <= 3.0:
			accelerationVertical = 0.0
			timer = 0.0
	elif accelerationVertical < 0.0:
		accelerationVertical += timer
		if accelerationVertical >= -3.0:
			accelerationVertical = 0.0
			timer = 0.0
	else:
		accelerationVertical = 0.0
		
func process_horizontal_slide():
	if accelerationHorizontal > 0.0:
		accelerationHorizontal -= timer
		if accelerationHorizontal <= 3.0:
			accelerationHorizontal = 0.0
			timer = 0.0
	elif accelerationHorizontal < 0.0 :
		accelerationHorizontal += timer
		if accelerationHorizontal >= -3.0:
			accelerationHorizontal = 0.0
			timer = 0.0
	else:
		accelerationHorizontal = 0.0
		
			
func animation_switch(animation):
	var new_animation = str(animation, spritedir)
	if $player_anim.current_animation!= new_animation:
		$player_anim.play(new_animation)
	