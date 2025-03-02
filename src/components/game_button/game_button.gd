extends Button
class_name GameButton

@onready var label = $Panel/VBoxContainer/Label

func set_game_name(game_name: String):
	label.text = game_name

func set_button_handler(handler: Callable):
	pressed.connect(handler)
