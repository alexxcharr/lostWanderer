extends Node


func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
func _input(event):
	if event.is_action_pressed("ui_up"):
		$click.play()
	if event.is_action_pressed("ui_down"):
		$click.play()
		
func _physics_process(delta):
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.grab_focus()
	

func _on_TextureButton_pressed():
	$startClick.play()
	$startTime.start()

func _on_TextureButton2_pressed():
	$Timer.start()
	$exitClick.play()

	

func _on_Timer_timeout():
	get_tree().quit()


func _on_startTime_timeout():
	get_tree().change_scene("game.tscn")
	
