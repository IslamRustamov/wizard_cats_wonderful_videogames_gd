extends Node2D
class_name ConnectionRoom

func _ready():
	$RoomsController.inject_network_client($NetworkClient)
	
	$Loader.hide_loader()
	$Loader.is_centered = false

func _on_button_pressed():
	$Button.disabled = true
	
	$Loader.set_text("Veryfying key")
	$Loader.show_loader()
	
	var response = await $RoomsController.join_room($LineEdit.text)
	
	GameStore.set_room_id(response.room_id)
	GameStore.set_room_password(response.password)
	PlayerStore.set_player_id(response.player_id)
	
	$Loader.set_text("Connecting...")

	ActionCable.connect_to_url(response.player_id)

func _process(_delta):
	if ConnectionStore.am_i_connected_to_room():
		$Loader.set_text("Waiting for players")
	
	# for knucklebones min users amount is 2
	# i should rewrite this for scalability
	# i should load all data about games (min_players, max_players) and stuff
	if ConnectionStore.has_enough_players(2):
		NavigationService.open_knucklebones_screen()
		#get_tree().change_scene_to_file("res://src/games/knucklebones/screens/main_screen.tscn")
