extends KinematicBody2D
onready var right_ray = get_node("rayRight")
onready var left_ray = get_node("rayLeft")
const speed = 50
var gravity = 10
const jump = -175
const min_jump = -50
const wall_jump = -50
const flo = Vector2(0, -1)
var vel = Vector2()
var on_ground = false
var wallBoo = false
var is_dead = false
var dialogue = false
var health = 4
var deathPosY = -138
var deathPosX = 47
var anime = "kati"
onready var pos1 = get_tree().get_root().get_node("game/stageOne/deathPosOne").get_position()
onready var pos2 = get_tree().get_root().get_node("game/stageOne/deathPosTwo").get_position()
onready var pos3 = get_tree().get_root().get_node("game/stageOne/deathPosThree").get_position()

func _ready():
	set_process_input(true)
	#get_node("heartCanvas").update(2)
	
func _input(event):

	if right_ray.is_colliding():
		wallBoo = true
		if event.is_action_pressed("ui_up"):
			vel.y = wall_jump
#			wallBoo = true
			gravity = 5
	if  left_ray.is_colliding():
		wallBoo = true
		if event.is_action_pressed("ui_up"):
			vel.y = wall_jump
		
	else:
		wallBoo = false
#		gravity = 10
	if event.is_action_pressed("ui_select"):
		print("at")
		$AnimatedSprite.play("attack")
		
func _physics_process(delta):

	if is_dead == false:
		wallBoo = false
		if Input.is_action_pressed("ui_right"):
			vel.x = speed
			$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = false
			#$Node/step1.play()
		elif Input.is_action_pressed("ui_left"):
			vel.x = -speed
			$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = true
		elif Input.is_action_pressed("ui_focus_next"):
			$AnimatedSprite.play("attack")
			anime = "attack"
		else:
			vel.x = 0
			
			$AnimatedSprite.play("idle")
			anime = "idle"
			
		#JUMP + SOUND EFFECT
		if Input.is_action_pressed("ui_up"):
			if on_ground == true and wallBoo == false:
				vel.y = jump
				on_ground = false
		if Input.is_action_just_released("ui_up"):
			if vel.y < min_jump:
				vel.y = min_jump
		if Input.is_action_pressed("ui_select"):
			$AnimatedSprite.play("attack")
		#STEPS SOUND EFFECT
		if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left"):
			if on_ground == true:
				$Node/step1.play()
		if Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left"):
			#if on_ground == true:
			$Node/step1.stop()
		if Input.is_action_just_pressed("ui_up"):
			if on_ground == false and wallBoo == false:
				$Node/jump.play()
		#if Input.is_action_just_released("ui_up"):
		#		$Node/jump.stop()
				
		
				
		vel.y += gravity
		
		if is_on_floor():
			on_ground = true
		else:
			on_ground = false

		vel = move_and_slide(vel, flo)

		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "spikes" in get_slide_collision(i).collider.name:
					$damageTime.start()
					damage()
				if "weapon" in get_slide_collision(i).collider.name:
					battle()
					#if "bat" in get_slide_collision(i).collider.name:

func dead():
	is_dead = true
	vel = Vector2(0, 0)
	$AnimatedSprite.play("dead")
	$CollisionShape2D.disabled = true
	#health -= 1
	#get_node("heartCanvas").update(health)
	#$Timer.start()
	
func battle(amount = 1):
	print("battle")

	get_node("heartCanvas").update(health)
	health -= amount
	$AnimatedSprite.play("dead")
	$CollisionShape2D.disabled = true
	is_dead = true
	$battleTime.start()
	


func _on_damageTime_timeout():
	vel.x = deathPosX
	vel.y = deathPosY
	print(vel)
	set_position(vel)	
	$AnimatedSprite.play("idle")
	$CollisionShape2D.disabled = false
	is_dead = false
	print("time")
	#damage()
	


func _on_Area2D_body_entered(body):
	if "player" in body.name:
		deathPosX = 0
		deathPosY = 0
		deathPosY = pos2.y
		deathPosX = pos2.x
	


func _on_Area1_body_entered(body):
	if "player" in body.name:
		deathPosX = 0
		deathPosY = 0
		deathPosX = pos1.x
		deathPosY = pos1.y


func _on_Area3_body_entered(body):
	if "player" in body.name:
		deathPosX = 0
		deathPosY = 0
		deathPosX = pos3.x
		deathPosY = pos3.y


func _on_dialogueArea_body_entered(body):
	pass
	#if "player" in body.name:
	#	is_dead = true

func _on_battleTime_timeout():
	is_dead = false
	$AnimatedSprite.play("idle")

func _on_Area2D2_body_entered(body):
	if "weapon" in body.name:
		battle()
	if "heart" in body.name:
		print("fu")
		get_node("heartCanvas").getHeart()
	if "fallingspikes" in body.name:
		#print("spike")
		damage()

func damage(amount = 1):
	print("why")
	$damage.play()
	$AnimatedSprite.play("dead")
	health -= amount
	get_node("heartCanvas").update(health)
	$damageTime.start()
	$CollisionShape2D.disabled = true
	is_dead = true	
