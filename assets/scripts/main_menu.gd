extends Control

@export var new_game_scene: PackedScene

func on_play_pressed():
	get_tree().change_scene_to_packed(new_game_scene)


func on_quit_pressed():
	get_tree().quit()
