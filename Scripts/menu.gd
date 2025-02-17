extends Control

func _ready(): pass

func _on_start_pressed():
	Loader.change_level("res://Scene/House.tscn")

func _on_quit_pressed() -> void: get_tree().quit()
