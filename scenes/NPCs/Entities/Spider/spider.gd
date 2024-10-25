extends Area2D

func on_character_interact(character: MainCharacter):
	var conv = Conversation.new([ConversationElement.new("Spider", "*You pick up the spider*")])
	GlobalSignals.set_main_text_conversation.emit(conv, func(): self.pickup_spider(character))

func pickup_spider(character: MainCharacter):
	# TODO - spider sprite
	character.inv.add_item(InventoryItem.new("spider", "A Spider", null))
	self.queue_free()