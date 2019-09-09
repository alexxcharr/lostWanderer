extends CanvasLayer

var heartFullText = preload("res://sprites/heart/heart1.png")
var heartEmptyText = preload("res://sprites/heart/heart4.png")
var count = 0
func _ready():
	$theme.play()
	
func update(hearts):
	#print("hearts")
	for i in range(0, get_node("HBoxContainer").get_children().size()):
		print(hearts)
		var heart = get_node("HBoxContainer").get_node("heart" + str(i))
		if (i+1) > hearts: heart.texture = heartEmptyText
		if hearts == 0:
			print("lost")
			get_tree().change_scene("looseScene.tscn")
		if heart.texture == heartEmptyText:
			print("empty")
			
func getHeart():
	for i in range(0, get_node("HBoxContainer").get_children().size()):
		var heart = get_node("HBoxContainer").get_node("heart" + str(i))
		print(heart)
		if heart.texture == heartEmptyText:
			count +=1
			if count > 0:
				heart.texture = heartFullText
			else:
				pass