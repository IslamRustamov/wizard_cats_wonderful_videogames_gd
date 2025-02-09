extends Node2D
class_name DiceUtils

var dice_scene = preload("res://src/games/knucklebones/components/dice/dice.tscn")
var dice_instance = null

var parent = null
var possible_positions = null

func set_parent(new_parent):
	parent = new_parent

func set_possible_positions(new_possible_positions):
	possible_positions = new_possible_positions

func create_dice():
	dice_instance = dice_scene.instantiate()
			
	dice_instance.position.x = parent.HORIZONTAL_OFFSET
	dice_instance.position.y = get_viewport_rect().size.y - parent.VERTICAL_OFFSET * 2

	add_child(dice_instance)
	
func put_dice():
	dice_instance.position.x = possible_positions[parent.current_pointer_position - 1].x
	dice_instance.position.y = possible_positions[parent.current_pointer_position - 1].y
	
