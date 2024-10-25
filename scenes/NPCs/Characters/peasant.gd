extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	self.sprite.play("idle")


func on_character_interact(_character: MainCharacter):
	var conv = Conversation.new([ConversationElement.new("Peasant", "I sure hate spiders!")])
	GlobalSignals.set_main_text_conversation.emit(conv, func(): pass)
