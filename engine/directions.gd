extends Node

const center 	= Vector2(0, 0)
const left 		= Vector2(-1, 0)
const right 	= Vector2(1, 0)
const up 		= Vector2(0, -1)
const down		= Vector2(0, 1)

func rand_movement():
	var d = randi() % 4 + 1
	match d:
		1: return left
		2: return right
		3: return up
		4: return down
		
var holds_beer = false
var beer_loaded = false
var beer_type = 0

var is_in_beer_area = false
var which_in_client_area = 0

var alkoValue = 200

var client_1_order = 0
var client_2_order = 0
var client_3_order = 0
var client_4_order = 0

var client_1_timer = 0
var client_2_timer = 0
var client_3_timer = 0
var client_4_timer = 0

var passable = false