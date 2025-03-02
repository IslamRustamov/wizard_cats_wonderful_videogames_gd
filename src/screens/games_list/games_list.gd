extends Node2D
class_name GamesListScreen

@onready var persistent_storage = $PersistentStorage

@onready var network_client = $NetworkClient
@onready var games_controller = $GamesController
@onready var players_controller = $PlayersController

@onready var loader = $Loader
@onready var games_list = $Panel/GamesList

func _ready():
	games_controller.inject_network_client(network_client)
	players_controller.inject_network_client(network_client)
	
	await init_player()
	
	var games = await get_games()
	
	GameStore.set_games(games)
	
	build_games_list(games)

func init_player():
	loader.set_text("Initialising player")
	loader.show_loader()
	
	var player_id = persistent_storage.get_id()
	
	if player_id == null:
		player_id = await players_controller.create_player()
		
		print(player_id)
		
		persistent_storage.save_id(player_id)
	else:
		print("found id, its ", player_id)

func get_games():
	loader.set_text("Loading list of games")
	
	var games = await games_controller.get_games()
	
	loader.hide_loader()
	
	return games

func build_games_list(games):
	for game in games:
		var button_pressed_handler = func():
			GameStore.set_selected_game(game)
			NavigationService.open_creating_room_screen()
		
		#var button = $ButtonUtils.create_button(game.name, button_pressed_handler)
		#
		#$List.push_list_item(button)
		
		games_list.add_new_button(game.name, button_pressed_handler)
