extends Node2D
class_name WaitingRoom

func _ready():
	$RoomsController.inject_network_client($NetworkClient)
	$RoomsController.inject_persistent_storage($PersistentStorage)

	hide_room_key_ui()

	if ConnectionStore.is_joining_room():
		try_to_join_room()
	elif ConnectionStore.is_creating_room():
		try_to_create_room()
	
func try_to_join_room():
	$Loader.set_text("verifying key")
	$Loader.show_loader()
	
	var response = await $RoomsController.join_room(GameStore.get_room_password())
	
	GameStore.set_room_id(response.room_id)
	PlayerStore.set_player_id(response.player_id)
	
	$Loader.set_text("connecting to room")

	ActionCable.connect_to_url(response.player_id)

func try_to_create_room():
	$Loader.set_text("creating room")
	$Loader.show_loader()

	var response = await $RoomsController.create_room({ "game_name": GameStore.get_selected_game().name })
	
	GameStore.set_room_id(response.room_id)
	GameStore.set_room_password(response.password)
	PlayerStore.set_player_id(response.player_id)
	
	$Loader.set_text("establishing connection")
	
	ActionCable.connect_to_url(response.player_id)
	
	show_room_key_ui()

func hide_room_key_ui():
	$Label.visible = false
	$CopyButton.visible = false

func show_room_key_ui():
	$Label.visible = true
	$CopyButton.visible = true

	$Label.text = "Your room key is: " + GameStore.get_room_password()
	
	$Label.position.x = get_viewport_rect().size.x / 2
	$Label.position.y = $Loader.position.y - 200
	
	$CopyButton.position.x = get_viewport_rect().size.x / 2 + $Label.size.x / 2 + 50
	$CopyButton.position.y = $Loader.position.y - 200 - $CopyButton/Button.size.y / 3
	
	$CopyButton.set_text_to_copy(GameStore.get_room_password())

func _process(_delta):
	if ConnectionStore.am_i_connected_to_room():
		$Loader.set_text("waiting for players")

	if ConnectionStore.has_enough_players(GameStore.get_selected_game().min_players):
		NavigationService.open_knucklebones_screen()

