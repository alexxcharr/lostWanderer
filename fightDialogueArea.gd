extends Area2D
var firstArrive = true


func _ready():
	visible = false
	
func _on_Timer_timeout():
	visible = true
	$CollisionShape2D/Polygon2D/Timer.start()


func _on_dialoguAeArea_body_entered(body):
	if "player" in body.name:
		if firstArrive == true:
			$CollisionShape2D/Timer.start()
#			firstArrive = false

