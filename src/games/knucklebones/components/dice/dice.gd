extends Node2D
class_name Dice

func _ready():
	var random_weight = randi() % 6 + 1
	
	set_dice_weight(random_weight)

func get_dice_weight():
	return $AnimatedSprite2D.frame + 1

func set_dice_weight(weight):
	$AnimatedSprite2D.frame = weight - 1
	
