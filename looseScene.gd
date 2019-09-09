extends Node2D


func _ready():
	$Polygon2D/MarginContainer/VBoxContainer/VBoxContainer/TextureButton3.grab_focus()
	$theme.play()
	
func _input(event):
	if event.is_action_pressed("ui_up"):
		$click.play()
	if event.is_action_pressed("ui_down"):
		$click.play()

func _physics_process(delta):
	if $Polygon2D/MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered() == true:
		$Polygon2D/MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	if $Polygon2D/MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.is_hovered() == true:
		$Polygon2D/MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.grab_focus()
	if $Polygon2D/MarginContainer/VBoxContainer/VBoxContainer/TextureButton3.is_hovered() == true:
		$Polygon2D/MarginContainer/VBoxContainer/VBoxContainer/TextureButton3.grab_focus()


func _on_TextureButton_pressed():
	$quit.play()
	
	get_tree().change_scene("menu.tscn")
	

func _on_TextureButton2_pressed():
	$Timer.start()
	#$exitClick.play()

func _on_TextureButton3_pressed():
	$quit.play()
	get_tree().change_scene("game.tscn")



func _on_Timer_timeout():
	get_tree().quit()
	$quit.play()
