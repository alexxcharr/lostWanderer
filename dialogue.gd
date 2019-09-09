extends RichTextLabel

var dialogue = ["Ohh where am I?", "This old thing takes me to the stangest places", "But let's see, maybe i will have more luck this time", "."]
var page = 0
var over = false
func _ready():
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	set_process_input(true)
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		pass
		
func _physics_process(delta):	
		if get_visible_characters() > get_total_character_count():
			if page < dialogue.size()-1:
				page += 1
				set_bbcode(dialogue[page])
				set_visible_characters(0)
			if page == dialogue.size() - 1:
				visible = false
				over = true

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
