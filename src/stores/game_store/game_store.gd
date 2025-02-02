extends Node2D

var selected_game = ""

var room_id = -1
var room_password = ""

var games = []

func set_games(new_games):
	games = new_games

func get_games():
	return games

func set_selected_game(game):
	selected_game = game
	
func get_selected_game():
	return selected_game

func set_room_id(id):
	room_id = id

func get_room_id():
	return room_id

func set_room_password(password):
	room_password = password
	
func get_room_password():
	return room_password
