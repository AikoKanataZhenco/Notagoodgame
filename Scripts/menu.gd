extends Node  

func _ready():
	get_node("menu").show()
	get_node("options").hide()
	get_node("sound").hide()

func show_menu():
	get_node("menu").show()
	get_node("options").hide()
	get_node("sound").hide()

func show_options():
	get_node("menu").hide()
	get_node("options").show()
	get_node("sound").hide()

func show_sound():
	get_node("menu").hide()
	get_node("options").hide()
	get_node("sound").show()
