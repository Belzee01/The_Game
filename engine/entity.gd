extends KinematicBody2D

const SPEED = 220

var movedir = dir.center
var spritedir = "_down"

func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, dir.center)
	
func spritedir_loop():
	match movedir:
		dir.left:
			spritedir = "_left"
		dir.right:
			spritedir = "_right"
		dir.up:
			spritedir = "_up"
		dir.down:
			spritedir = "_down"
			
func animation_switch(animation):
	var new_animation = str(animation, spritedir)
	if $player_anim.current_animation!= new_animation:
		$player_anim.play(new_animation)
	