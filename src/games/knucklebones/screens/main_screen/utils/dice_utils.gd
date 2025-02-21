extends Node2D
class_name DiceUtils

var dice_scene = preload("res://src/games/knucklebones/components/dice/dice.tscn")
var dice_instance: Dice = null

func create_dice():
	dice_instance = dice_scene.instantiate()
	
	dice_instance.position = Vector2(
		get_parent().get_viewport_rect().size.x / 2, 
		get_parent().get_viewport_rect().size.y / 2,
	)
	
	get_parent().add_child(dice_instance)

func create_enemy_dice(weight: int):
	dice_instance = dice_scene.instantiate()
	
	dice_instance.position = Vector2(
		get_parent().get_viewport_rect().size.x / 2, 
		get_parent().get_viewport_rect().size.y / 2,
	)
	
	get_parent().add_child(dice_instance)
	
	dice_instance.set_dice_weight(weight)
