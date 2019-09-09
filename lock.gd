extends KinematicBody2D

var vel = Vector2()
var speed = 80
var startMove = false

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if startMove == true:
		if get_position().y <= 23:
			set_position(vel)
			vel.y +=1

func _on_dialoguAeArea_body_entered(body):
	if "player" in body.name:
		$wallSound.play()
		startMove = true
		