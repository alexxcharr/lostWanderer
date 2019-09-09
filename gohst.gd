extends KinematicBody2D

var gohstShow = false

func _ready():
	$AnimatedSprite.play("cloak")


func _on_Area2D_body_entered(body):
	if "player" in body.name:
		$AnimatedSprite.play("unfold")
		$unfold.play()
		gohstShow = true

func _on_Area2D_body_exited(body):
	if "player" in body.name:
		gohstShow = false
		#$gohstTalk.stop()
		$fold.play()
		$AnimatedSprite.play("death")
		

func _on_AnimatedSprite_animation_finished():
	if gohstShow == true:
		$AnimatedSprite.play("default")
	if gohstShow == false:
		$AnimatedSprite.play("cloak")
	

func _on_unfold_finished():
	pass
	#$gohstTalk.play()
