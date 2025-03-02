extends Control
class_name GamesList

@onready var debug_button = $ScrollContainer/HBoxContainer/Button
@onready var h_container = $ScrollContainer/HBoxContainer

var game_button_scene = preload("res://src/components/game_button/game_button.tscn")

func _ready():
	# DEBUG
	if get_parent() != get_window():
		debug_button.queue_free()
		
func add_new_button(game_name: String, button_pressed_handler: Callable):
	var game_button_instance: GameButton = game_button_scene.instantiate()
		
	h_container.add_child(game_button_instance)
	
	game_button_instance.set_game_name(game_name)
	game_button_instance.set_button_handler(button_pressed_handler)

	#var game_button = GameButton.new()
	#
	#h_container.add_child(game_button)
		
	#game_button.set_game_name(game_name)

# deprecated
func push_list_item(item):
	pass
	#$VBoxContainer.add_child(item)

