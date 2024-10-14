extends Node
class_name Signals

# this seems bad? but it simplifies a lot of the game -> UI logic... maybe there is a better way?

@warning_ignore("unused_signal")
signal open_inventory(inv: Inventory)

@warning_ignore("unused_signal")
signal set_main_text_conversation(conversation: Conversation, complete_callback: Callable)
