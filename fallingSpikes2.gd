extends KinematicBody2D
var speed = 80
var vel = Vector2()
var startMove = false
var firstFall = true
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if startMove == true:
		if firstFall == true:
			if vel.y <= 75:
				set_position(vel)
				vel.y += 1
			else:
				firstFall = false
	
func _on_spike2_body_entered(body):
	if "player" in body.name:
		if firstFall == true:
			$spikeSound2.play()
			startMove = true
			
