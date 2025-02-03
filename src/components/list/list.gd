extends Node2D
class_name List

func _ready():
	$Control.size.x = get_viewport_rect().size.x
	$Control.size.y = get_viewport_rect().size.y

func push_list_item(item):
	$Control/VBoxContainer.add_child(item)
