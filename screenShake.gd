extends Node2D

var shake = true
var current_priority = 0
func _ready():
	pass # Replace with function body.

func move_camera(vector):
	get_parent().get_node("player").get_node("Camera2D").offset = Vector2(rand_range(-vector.x, vector.x), rand_range(-vector.y, vector.y))
	
func screen_shake(shake_length, shake_power, shake_priority):
	if shake_priority > current_priority:
		if shake == true:
			current_priority = shake_priority
			$Tween.interpolate_method(self, "move_camera",Vector2(shake_power, shake_power), Vector2(0, 0), shake_length, Tween.TRANS_SINE, Tween.EASE_OUT, 0)
			$Tween.start()
			shake = false

func _on_Tween_tween_completed(object, key):
	current_priority = 0