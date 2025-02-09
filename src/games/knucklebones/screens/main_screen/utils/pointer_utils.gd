extends Node2D
class_name PointerUtils

var parent = null
var pointer = null
var possible_positions = null

func set_parent(new_parent):
	parent = new_parent
	
func set_pointer(new_pointer):
	pointer = new_pointer

func set_possible_positions(new_possible_positions):
	possible_positions = new_possible_positions

func move_pointer_left():
	if parent.current_pointer_position == 1:
		parent.current_pointer_position = 3
	else:
		parent.current_pointer_position = parent.current_pointer_position - 1
	
	update_pointer_scene_position()

func move_pointer_right():
	if parent.current_pointer_position == 3:
		parent.current_pointer_position = 1
	else:
		parent.current_pointer_position = parent.current_pointer_position + 1
	
	update_pointer_scene_position()

func update_pointer_scene_position():
	pointer.position.x = possible_positions[parent.current_pointer_position - 1].x
	pointer.position.y = possible_positions[parent.current_pointer_position - 1].y
