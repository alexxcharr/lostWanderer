extends KinematicBody2D

var vel = Vector2()
var speed = 60
var jump = 120 

func _physics_process(delta):
	vel = move_and_slide(vel)
func _ready():
	pass # Replace with function body.
func _input(event):
	if event.is_action_pressed("ui_accept"):
		vel.x += speed
		vel.y += jump
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
