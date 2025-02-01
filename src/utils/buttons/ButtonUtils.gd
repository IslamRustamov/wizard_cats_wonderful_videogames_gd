extends Node2D
class_name ButtonUtils

var font = FontVariation.new()

func _ready():
	font.base_font = load("res://assets/fonts/fffforward.ttf")

func create_button(game_name, press_handler):
	var button = Button.new()
	
	button.custom_minimum_size.x = 500
	button.custom_minimum_size.y = 200
	button.text = game_name
	
	button.add_theme_font_override("font", font)
	button.add_theme_font_size_override("font_size", 40)
	
	button.pressed.connect(press_handler)
	
	return button
