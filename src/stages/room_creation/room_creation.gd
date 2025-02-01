extends Node2D
class_name RoomCreation

func _ready():
	$RoomsController.inject_network_client($NetworkClient)
	
	create_room_creation_button()
	create_room_joining_button()
	
func create_room_creation_button():
	var button_pressed_handler = func():
		$RoomsController.create_room({ "game_name": GameStore.get_selected_game() })
	
	var button = $ButtonUtils.create_button("create room", button_pressed_handler)
	
	$List.push_list_item(button)

func create_room_joining_button():
	var button_pressed_handler = func():
		print("pressed join room button")
	
	var button = $ButtonUtils.create_button("join room", button_pressed_handler)
	
	$List.push_list_item(button)
