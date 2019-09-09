extends KinematicBody2D

var firstArrive = true
var gohstShow = false
var animation = "rise"
var anInt = 0
var fly = false
var vel = Vector2()
var gohstPos = Vector2()
onready var playerPos = get_tree().get_root().get_node("game/stageOne/player").get_position()
func _ready():
	pass
	
func _physics_process(delta):
	if fly == true:
		set_position(vel)
		vel.x -= 2
	playerPos = get_tree().get_root().get_node("game/stageOne/player").get_position()
	gohstPos = get_position()
	if playerPos.x > gohstPos.x:
		$bossAnimation.set_flip_h(false)

	elif playerPos.x < gohstPos.x:
		$bossAnimation.set_flip_h(true)
		print("aristera")
		print(gohstPos.x)

			
	#vel = move_and_slide(vel)
func _on_areaTalk_body_entered(body):
	if "player" in body.name:
		if firstArrive == true:
			$bossAnimation.play("rise")
			firstArrive = false
			$general.start()



func _on_general_timeout():
	anInt += 1
	if anInt%2 == 0:
		$bossAnimation.play("attack1")
		get_parent().get_node("weapon").visible = true
		get_parent().get_node("weapon/AnimatedSprite").play("attack")
	else:
		$bossAnimation.play("attack2")
		fly = true
		$stopFly.start()
		$CollisionShape2D.disabled = true
		##return vel.x
	#$weapon.speed = 40
	animation = "attack"

	

func _on_dialoguAeArea_body_entered(body):
	if "player" in body.name:
		if firstArrive == true:
			$bossAnimation.play("rise")
			firstArrive = false
			$general.start()

			
func _on_bossAnimation_animation_finished():
	if animation == "rise":
		$bossAnimation.play("idle")
	if animation == "attack":
		$bossAnimation.play("idle")
	

func _on_stopFly_timeout():
	fly = false
	$CollisionShape2D.disabled = false
	print("fly")