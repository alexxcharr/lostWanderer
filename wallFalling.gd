extends KinematicBody2D
var vel = Vector2()
var speed = 0
var firstFall = true

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	if get_position().y <= 65:
		move_and_slide(vel)
	
		


func _on_Area2D_body_entered(body):
	if "player" in body.name:
		if firstFall == true:
			$rockTime.start()
			$rockSound.play()
			firstFall = false	


func _on_rockTime_timeout():
	vel.y += 80