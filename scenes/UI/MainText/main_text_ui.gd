extends Control
class_name MainTextUI

@export var text: RichTextLabel
@export var text_window: Control

var current_conversation: Conversation
var current_complete_callback: Callable

func _ready():
	self.text_window.visible = false
	GlobalSignals.set_main_text_conversation.connect(set_conversation)


func set_conversation(conversation: Conversation, complete_callback: Callable):
	self.current_conversation = conversation
	self.current_complete_callback = complete_callback
	self.text_window.visible = true
	self.set_current_text()


func set_current_text():
	var p := current_conversation.get_current_panel()
	self.text.text = "[font_size=19][b]%s[/b][/font_size]\n%s" % [p.title, p.message]


func _input(event):
	if not current_conversation:
		return
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		if self.text_window.get_global_rect().has_point(event.position):
			if current_conversation.set_next_panel():
				self.set_current_text()
			else:
				self.text_window.visible = false
				self.current_conversation = null
				if self.current_complete_callback is Callable:
					self.current_complete_callback.call()

func is_shown() -> bool:
	return self.text_window.visible