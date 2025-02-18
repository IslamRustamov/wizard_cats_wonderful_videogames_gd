extends Node2D
class_name DeskUtils

func get_columns() -> Array[Column]:
	if get_parent().store.is_wizards_cats_move():
		return get_parent().desk.get_wizard_cats_columns()
	else:
		return get_parent().desk.get_crocoboys_columns()
