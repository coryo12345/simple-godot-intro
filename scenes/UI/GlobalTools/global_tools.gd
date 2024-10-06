extends Control

@export var player_character: Node2D

func _on_backpack_opened():
	if player_character && player_character.has_method("toggle_character_inventory"):
		player_character.toggle_character_inventory()

