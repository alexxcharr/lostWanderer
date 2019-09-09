extends KinematicBody2D

var vel = Vector2()
var speed = 80
var startMove = false
var open = false

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if startMove == true:
		if get_position().y <= -1:
			set_position(vel)
			vel.y +=1
		else: startMove = false
	if open == true:
		if get_position().y >= -16:
			set_position(vel)
			vel.y-=1
		else:
			get_tree().change_scene("thanks.tscn")

func _on_dialoguAeArea_body_entered(body):
	if "player" in body.name:
		#$wallSound.play()
		startMove = true
		

func _on_Area2D_body_entered(body):
	if "player" in body.name:
		open = true
