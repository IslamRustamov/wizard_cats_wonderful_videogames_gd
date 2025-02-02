extends Node2D

func open_creating_room_screen():
	get_tree().change_scene_to_file("res://src/screens/creating_room/creating_room.tscn")
	
func open_waiting_room_screen():
	get_tree().change_scene_to_file("res://src/screens/waiting_room/waiting_room.tscn")

func open_joining_room_screen():
	get_tree().change_scene_to_file("res://src/screens/joining_room/joining_room.tscn")

func open_knucklebones_screen():
	get_tree().change_scene_to_file("res://src/games/knucklebones/screens/main_screen/main_screen.tscn")
