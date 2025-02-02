extends Node2D

enum ROOM_CONNECTION_TYPE { JOINING, CREATING }

var connected_players_ids = []
var room_connection_type = null

func is_joining_room():
	return room_connection_type == ROOM_CONNECTION_TYPE.JOINING

func is_creating_room():
	return room_connection_type == ROOM_CONNECTION_TYPE.CREATING
	
func set_room_connection_type(type):
	room_connection_type = type

func push_connected_players_ids(player_id):
	connected_players_ids.push_back(player_id)
	
func set_connected_players_ids(player_ids):
	connected_players_ids = player_ids

func get_connected_players_ids():
	return connected_players_ids

func am_i_connected_to_room():
	return connected_players_ids.has(PlayerStore.get_player_id())

func has_enough_players(min_players_count):
	return connected_players_ids.size() >= min_players_count
