extends RichTextLabel

var dialogue = ["hello there", "i told you"]
var page = 0 

func _ready():
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	set_process_input(true)
	
func _physics_process(delta):	
		if get_visible_characters() > get_total_character_count():
			if page < dialogue.size()-1:
				page += 1
				set_bbcode(dialogue[page])
				set_visible_characters(0)
			if page == dialogue.size() - 1:
				#get_parent().get_parent().get_parent().get_parent().get_node("attackTimer").start()
				visible = false
				
func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
