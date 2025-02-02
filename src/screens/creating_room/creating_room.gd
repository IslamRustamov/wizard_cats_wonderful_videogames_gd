extends Node2D
class_name CreatingRoom

func _ready():
	create_room_creating_button()
	create_room_joining_button()
	
func create_room_creating_button():
	var button_pressed_handler = func():
		ConnectionStore.set_room_connection_type(ConnectionStore.ROOM_CONNECTION_TYPE.CREATING)
		
		NavigationService.open_waiting_room_screen()
	
	var button = $ButtonUtils.create_button("create room", button_pressed_handler)
	
	$List.push_list_item(button)

func create_room_joining_button():
	var button_pressed_handler = func():
		ConnectionStore.set_room_connection_type(ConnectionStore.ROOM_CONNECTION_TYPE.JOINING)
		
		NavigationService.open_joining_room_screen()
	
	var button = $ButtonUtils.create_button("join room", button_pressed_handler)
	
	$List.push_list_item(button)
