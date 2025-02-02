extends Node2D
class_name WaitingRoom

func _ready():
	$Loader.set_text("Connecting to the room")
	$Loader.show_loader()
	
	ActionCable.connect_to_url(PlayerStore.get_player_id())
	
	$Label.text = "Your room key is: " + GameStore.get_room_password()
	
	$Label.position.x = get_viewport_rect().size.x / 2
	$Label.position.y = $Loader.position.y - 200
	
	$CopyButton.position.x = get_viewport_rect().size.x / 2 + $Label.size.x / 2 + 50
	$CopyButton.position.y = $Loader.position.y - 200 - $CopyButton/Button.size.y / 3
	
	$CopyButton.set_text_to_copy(GameStore.get_room_password())
	
func _process(_delta):
	if ConnectionStore.am_i_connected_to_room():
		$Loader.set_text("Waiting for players")
	
	# for knucklebones min users amount is 2
	# i should rewrite this for scalability
	# i should load all data about games (min_players, max_players) and stuff
	if ConnectionStore.has_enough_players(2):
		NavigationService.open_knucklebones_screen()
		#get_tree().change_scene_to_file("res://src/games/knucklebones/screens/main_screen.tscn")
