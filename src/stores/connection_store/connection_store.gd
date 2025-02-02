extends Node2D

var is_connected_to_room = false

var connected_players_ids = []

func push_connected_players_ids(player_id):
	connected_players_ids.push_back(player_id)
	
func set_connected_players_ids(player_ids):
	connected_players_ids = player_ids

func am_i_connected_to_room():
	return connected_players_ids.has(PlayerStore.get_player_id())

func has_enough_players(min_players_count):
	return connected_players_ids.size() >= min_players_count

func set_is_connected_to_room(connected):
	is_connected_to_room = connected

func get_is_connected_to_room():
	return is_connected_to_room
