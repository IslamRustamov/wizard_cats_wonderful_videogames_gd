extends Node2D
class_name PointerUtils

var pointer_scene = preload("res://src/games/knucklebones/components/pointer/pointer.tscn")
var pointer_instance = null

func create_pointer():
	var columns: Array[Column] = get_parent().desk_utils.get_columns()
	
	pointer_instance = pointer_scene.instantiate()
	
	columns[get_parent().current_pointer_position - 1].set_pointer(pointer_instance, get_parent().store.is_crocoboys_move())

func move_pointer_right():
	var columns: Array[Column] = get_parent().desk_utils.get_columns()
	
	columns[get_parent().current_pointer_position - 1].remove_pointer(pointer_instance)
	
	if get_parent().current_pointer_position == 3:
		get_parent().current_pointer_position = 1
	else:
		get_parent().current_pointer_position = get_parent().current_pointer_position + 1

	columns[get_parent().current_pointer_position - 1].set_pointer(pointer_instance, get_parent().store.is_crocoboys_move())
	
func move_pointer_left():
	var columns: Array[Column] = get_parent().desk_utils.get_columns()
	
	columns[get_parent().current_pointer_position - 1].remove_pointer(pointer_instance)
	
	if get_parent().current_pointer_position == 1:
		get_parent().current_pointer_position = 3
	else:
		get_parent().current_pointer_position = get_parent().current_pointer_position - 1

	columns[get_parent().current_pointer_position - 1].set_pointer(pointer_instance, get_parent().store.is_crocoboys_move())
	
