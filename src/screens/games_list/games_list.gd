extends Node2D
class_name GamesList

func _ready():
	$GamesController.inject_network_client($NetworkClient)
	$PlayersController.inject_network_client($NetworkClient)
	
	await init_player()
	
	var games = await get_games()
	
	GameStore.set_games(games)
	
	build_games_list(games)

func init_player():
	$Loader.set_text("Initialising player")
	$Loader.show_loader()
	
	var player_id = $PersistentStorage.get_id()
	
	if player_id == null:
		player_id = await $PlayersController.create_player()
		
		print(player_id)
		
		$PersistentStorage.save_id(player_id)
	else:
		print("found id, its ", player_id)

func get_games():
	$Loader.set_text("Loading list of games")
	
	var games = await $GamesController.get_games()
	
	$Loader.hide_loader()
	
	return games

func build_games_list(games):
	for game in games:
		var button_pressed_handler = func():
			GameStore.set_selected_game(game)
			NavigationService.open_creating_room_screen()
		
		var button = $ButtonUtils.create_button(game.name, button_pressed_handler)
		
		$List.push_list_item(button)
