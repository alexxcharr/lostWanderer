extends Area2D

func _ready():
	visible = true

func _on_statueArea_body_entered(body):
	if "player" in body.name:
		$CollisionShape2D/Timer.start()
	

func _on_Timer_timeout():
	#visible = true
	$CollisionShape2D/Polygon2D/Timer.start()