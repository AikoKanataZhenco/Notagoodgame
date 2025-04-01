extends Control

func _ready() -> void:
	# Ensure only the main menu buttons are visible at start
	$VBoxContainer/Volume.visible = false
	$VBoxContainer/Back.visible = false
	$VBoxContainer/Label.visible = false

func _on_start_pressed() -> void:
	# Disconnect any existing connection first
	if Dialogic.timeline_ended.is_connected(_on_timeline_finished):
		Dialogic.timeline_ended.disconnect(_on_timeline_finished)
	
	# Connect the signal
	Dialogic.timeline_ended.connect(_on_timeline_finished)
	
	# Start the Dialogic timeline
	Dialogic.start("res://DialogicFiles/Scene 1/Scene1.dtl")

# Transition to the game level after the Dialogic timeline finishes
func _on_timeline_finished() -> void:  # Remove the parameter
	# Important: Disconnect first to prevent looping
	if Dialogic.timeline_ended.is_connected(_on_timeline_finished):
		Dialogic.timeline_ended.disconnect(_on_timeline_finished)
		
	# Since we don't get the timeline name, we can't check it
	# Just change the scene directly
	get_tree().change_scene_to_file("res://Scene/game_lvl.tscn")
func _on_options_pressed() -> void:
	$VBoxContainer/Start.visible = false
	$VBoxContainer/Options.visible = false
	$VBoxContainer/Quit.visible = false

	$VBoxContainer/Volume.visible = true
	$VBoxContainer/Back.visible = true
	$VBoxContainer/Label.visible = true

# Handle "Quit" button functionality
func _on_quit_pressed() -> void:
	get_tree().quit()

# Handle "Back" button functionality (to return to the main menu)
func _on_back_pressed() -> void:
	$VBoxContainer/Volume.visible = false
	$VBoxContainer/Back.visible = false
	$VBoxContainer/Label.visible = false

	$VBoxContainer/Start.visible = true
	$VBoxContainer/Options.visible = true
	$VBoxContainer/Quit.visible = true

# Handle volume slider changes
func _on_volume_value_changed(value: float) -> void:
	var db_value = lerp(-80, 0, value / 100.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), db_value)
	print("Slider Value:", value, " | dB Value:", db_value)  # Debug
