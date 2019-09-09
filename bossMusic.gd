extends Node2D
var vol = -40
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_dialoguAeArea_body_entered(body):
	if "player" in body.name:
		$AudioStreamPlayer.play()
		get_tree().get_root().get_node("game/stageOne/player/heartCanvas/theme").stop()