extends Node2D

func open_room_creation_screen():
	get_tree().change_scene_to_file("res://src/screens/room_creation/room_creation.tscn")
	
func open_waiting_room_screen():
	get_tree().change_scene_to_file("res://src/screens/waiting_room/waiting_room.tscn")

func open_connection_room_screen():
	get_tree().change_scene_to_file("res://src/screens/connection_room/connection_room.tscn")

func open_knucklebones_screen():
	get_tree().change_scene_to_file("res://src/games/knucklebones/screens/main_screen.tscn")
