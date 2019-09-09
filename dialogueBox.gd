extends Area2D

var firstFall = true
func _ready():
	visible = false
	
func _on_dialogueArea_body_entered(body):
	if "player" in body.name:
		if firstFall == true:
			get_parent().get_node("screenShake").screen_shake(0.6, 2, 100)
			$gdup.play()
			$CollisionShape2D/Timer.start()
			firstFall = false
	

func _on_Timer_timeout():
	#if firstFall == true:
		visible = true
		$CollisionShape2D/dialogue/Timer.start()
