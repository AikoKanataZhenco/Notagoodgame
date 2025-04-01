extends Node2D  # Use Node2D as the base class

var player_in_area = false  # Tracks if the player is in the chat zone

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):  # Ensure it's the player
		player_in_area = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = false

func _process(delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("interact"):
		start_dialogue()

func start_dialogue() -> void:
	print("Dialogue triggered!")  # Replace with actual dialogue system call
	Dialogic.start("res://DialogicFiles/Scene 2/Scene2.dtl")  # Example for Dialogic users
