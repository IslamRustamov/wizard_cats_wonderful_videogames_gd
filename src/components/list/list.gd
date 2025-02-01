extends Node2D
class_name List

func push_list_item(item):
	$Control/VBoxContainer.add_child(item)
