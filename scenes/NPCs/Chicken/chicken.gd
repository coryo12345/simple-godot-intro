extends Area2D

func on_character_interact(_character: MainCharacter):
	var conv = Conversation.new([ConversationElement.new("Chicken", "Cluck cluck!")])
	GlobalSignals.set_main_text_conversation.emit(conv, func(): pass)
