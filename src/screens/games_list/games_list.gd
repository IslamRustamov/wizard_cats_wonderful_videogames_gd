extends Node2D
class_name GamesList

func _ready():
	$GamesController.inject_network_client($NetworkClient)
	
	var games = await get_games()
	save_games(games)
	build_games_list(games)
	
func save_games(games):
	GameStore.set_games(games)

func get_games():
	$Loader.set_text("Loading list of games")
	$Loader.show_loader()
	
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
