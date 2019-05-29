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
var alkoValue = 200

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
	if alkoTimer >= 1.0:
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
	
func hold_beer(beer):
	var current_beer = beer.instance()
	current_beer.add_to_group(str("beer", self))
	add_child(current_beer)
	if get_tree().get_nodes_in_group(str("beer", self)).size() > 1:
		current_beer.queue_free()
		
func leave_beer():
	if get_tree().get_nodes_in_group(str("beer", self)).size() > 0:
		var current_beer = get_tree().get_nodes_in_group(str("beer", self)).pop_front()
		remove_child(current_beer)
		current_beer.queue_free()
		dir.beer_loaded = false
		
func pass_beer():
	if dir.which_in_client_area != 0:
		if get_tree().get_nodes_in_group(str("beer", self)).size() > 0:
			var current_beer = get_tree().get_nodes_in_group(str("beer", self)).pop_front()
			process_beer_points(current_beer)
			remove_child(current_beer)
			current_beer.queue_free()
			dir.beer_loaded = false
			dir.holds_beer = false
			
func process_beer_points(beer):
	pass