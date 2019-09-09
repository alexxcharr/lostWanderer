extends KinematicBody2D
var speed = 80
var vel = Vector2()
var firstFall = true
var startMove = false

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if startMove == true:
		if firstFall == true:
			if vel.y <= 75:
				set_position(vel)
				vel.y +=1
			else:
				firstFall = false
					
	

func _on_spike3_body_entered(body):
		if "player" in body.name:
			if firstFall == true:
				$spikeSound3.play()
				startMove = true	