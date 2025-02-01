extends Node2D
class_name GamesList

func _ready():
	$GamesController.inject_network_client($NetworkClient)
	
	var games = await get_games()
	build_games_list(games)

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
			get_tree().change_scene_to_file("res://src/stages/room_creation/room_creation.tscn")
		
		var button = $ButtonUtils.create_button(game, button_pressed_handler)
		
		$List.push_list_item(button)
