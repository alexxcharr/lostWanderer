extends Node
#mmixamo
onready var star = preload("res://star.tscn")
onready var starCont = get_node("stars")

var screensize

func _ready():
	randomize()
	screensize = get_viewport().size
	print(screensize)
	set_process(true)
	spawn_stars(100)
	print("alex")
	
	
func spawn_stars(num):
	print("hi")
	for i in range(num):
		var s = star.instance()
		starCont.add_child(s)
		s.position.x = rand_range(0, 800)
		s.position.y = rand_range(-120, 180)

