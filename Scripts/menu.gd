extends Control

func _ready() -> void:
	# Ensure only the main menu buttons are visible at start
	$VBoxContainer/Volume.visible = false
	$VBoxContainer/Back.visible = false
	$VBoxContainer/Label.visible = false

# Handle "Start" button functionality
func _on_start_pressed() -> void:
	Loader.change_level("res://Scene/HouseInt1.tscn")

# Handle "Options" button functionality
func _on_options_pressed() -> void:
	# Hide the main menu buttons
	$VBoxContainer/Start.visible = false
	$VBoxContainer/Options.visible = false
	$VBoxContainer/Quit.visible = false

	# Show the options UI
	$VBoxContainer/Volume.visible = true
	$VBoxContainer/Back.visible = true
	$VBoxContainer/Label.visible = true

# Handle "Quit" button functionality
func _on_quit_pressed() -> void:
	get_tree().quit()

# Handle "Back" button functionality (to return to the main menu)
func _on_back_pressed() -> void:
	# Hide the options UI
	$VBoxContainer/Volume.visible = false
	$VBoxContainer/Back.visible = false
	$VBoxContainer/Label.visible = false

	# Show the main menu buttons
	$VBoxContainer/Start.visible = true
	$VBoxContainer/Options.visible = true
	$VBoxContainer/Quit.visible = true

# Handle volume slider changes
func _on_volume_value_changed(value: float) -> void:
	# Map slider value from 0-100 to a decibel range of -80 to 0
	var db_value = lerp(-80, 0, value / 100.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), db_value)
	print("Slider Value:", value, " | dB Value:", db_value)  # Debug to verify functionality

# Additional button function (if needed)
