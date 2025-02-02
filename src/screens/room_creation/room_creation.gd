extends Node2D
class_name RoomCreation

func _ready():
	$RoomsController.inject_network_client($NetworkClient)
	
	create_room_creation_button()
	create_room_joining_button()
	
func create_room_creation_button():
	var button_pressed_handler = func():
		var response = await $RoomsController.create_room({ "game_name": GameStore.get_selected_game().name })
		
		GameStore.set_room_id(response.room_id)
		GameStore.set_room_password(response.password)
		PlayerStore.set_player_id(response.player_id)
		
		NavigationService.open_waiting_room_screen()
		
		#get_tree().change_scene_to_file("res://src/screens/waiting_room/waiting_room.tscn")
	
	var button = $ButtonUtils.create_button("create room", button_pressed_handler)
	
	$List.push_list_item(button)

func create_room_joining_button():
	var button_pressed_handler = func():
		NavigationService.open_connection_room_screen()
		#get_tree().change_scene_to_file("res://src/screens/connection_room/connection_room.tscn")
	
	var button = $ButtonUtils.create_button("join room", button_pressed_handler)
	
	$List.push_list_item(button)
