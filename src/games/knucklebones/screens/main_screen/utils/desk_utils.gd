extends Node2D
class_name DeskUtils

func get_columns() -> Array[Column]:
	var store = get_parent().store
	var desk = get_parent().desk
	
	if store.is_wizards_cats_move():
		return desk.get_wizard_cats_columns()
	else:
		return desk.get_crocoboys_columns()
