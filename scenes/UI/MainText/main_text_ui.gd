extends Control

@onready var text: RichTextLabel = $"PanelContainer/TextLabel"

var current_conversation: Conversation

func _ready():
	self.visible = false
	GlobalSignals.set_main_text_conversation.connect(set_conversation)


func set_conversation(conversation: Conversation):
	self.current_conversation = conversation
	self.visible = true
	self.set_current_text()


func set_current_text():
	var p := current_conversation.get_current_panel()
	text.text = "[font_size=19][b]%s[/b][/font_size]\n%s" % [p.title, p.message]


func _input(event):
	if not current_conversation:
		return
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		if self.get_global_rect().has_point(event.position):
			if current_conversation.set_next_panel():
				self.set_current_text()
			else:
				self.visible = false
				self.current_conversation = null

