extends Node2D
class_name  Column

const MAX_DICES = 3

var dices: Array[Dice] = []

var score = 0

var column_width = 200
var column_height = 600
var line_width = 10

@export var debug = true
var debug_dice_id = 0

func _input(event):
	if debug:
		if event.is_action_released("Action"):
			var dice: Dice = Dice.constructor(debug_dice_id)
			
			dice.name = "Dice" + str(debug_dice_id)
			
			add_dice(dice)

			debug_dice_id += 1

func add_dice(new_dice: Dice):
	if dices.size() == MAX_DICES:
		return

	add_child(new_dice)
	
	new_dice.position.x = column_width / 2
	
	if dices.size() == 0:
		new_dice.position.y = 100
	elif dices.size() == 1:
		new_dice.position.y = 300
	elif dices.size() == 2:
		new_dice.position.y = 500
		
	dices.push_back(new_dice)
	
	recalculate_score()

func clear():
	dices = []
	
	recalculate_score()
	
func recalculate_score():
	score = 0
	
	var dict = {}
	
	for dice in dices:
		var weight = dice.get_dice_weight()
		
		if dict.has(str(weight)):
			dict[str(weight)].occurences += 1
		else:
			dict[str(weight)] = { "weight": weight, "occurences": 1 }
	
	for key in dict:
		if dict[key].occurences > 1:
			var sum = 0
			
			for i in dict[key].occurences:
				sum += dict[key].weight
			
			score += sum * dict[key].occurences
		else:
			score += dict[key].weight
		
func _draw():
	draw_rect(
		Rect2(
			position.x, 
			position.y, 
			column_width, 
			column_height
		), 
		Color.WHITE, 
		false, 
		line_width
	)
