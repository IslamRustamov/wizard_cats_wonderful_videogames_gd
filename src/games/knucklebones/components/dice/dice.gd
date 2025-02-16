extends Node2D
class_name Dice

const self_scene = preload("res://src/games/knucklebones/components/dice/dice.tscn")

@export var slot_id: int

static func constructor(id: int = 0)-> Dice:
	var obj = self_scene.instantiate()
	obj.slot_id = id
	return obj

func _ready():
	var random_weight = randi() % 6 + 1
	
	set_dice_weight(random_weight)

func get_dice_weight():
	return $AnimatedSprite2D.frame + 1

func set_dice_weight(weight):
	$AnimatedSprite2D.frame = weight - 1
	
