extends Node2D
class_name GamesList

func _ready():
	$GamesController.inject_network_client($NetworkClient)
	
	get_games()

func get_games():
	$Loader.set_text("Loading list of games")
	$Loader.show_loader()
	
	var games = await $GamesController.get_games()
	
	$Loader.hide_loader()

	print(games)
