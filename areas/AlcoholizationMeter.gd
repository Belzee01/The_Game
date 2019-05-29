extends TextureProgress

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var timer = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


func _process(delta):
	timer += delta
	if timer >= 1.0:
		timer = 0.0
		value = dir.alkoValue
