extends Node2D
class_name  Column

const MAX_DICES = 3

var dices: Array[Dice] = []

var score = 0

var column_width = 200
var column_height = 600
var line_width = 10

@export var debug = false
var debug_dice_id = 0

func _input(event):
	if debug:
		if event.is_action_released("Action"):
			var dice: Dice = Dice.constructor(debug_dice_id)
			
			dice.name = "Dice" + str(debug_dice_id)
			
			add_dice(dice)

			debug_dice_id += 1
			
func can_add_dice():
	return dices.size() < MAX_DICES

func add_dice(new_dice: Dice):
	if !can_add_dice():
		return

	add_child(new_dice)
	
	new_dice.global_position = Vector2(get_viewport_rect().size.x / 2, get_viewport_rect().size.y / 2)
	
	var vector = Vector2.ZERO
	
	vector.x = global_position.x + column_width / 2
	vector.y = global_position.y + 100 + dices.size() * 200
		
	new_dice.play_dice_adding_animation(vector)
		
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

func set_pointer(pointer: Pointer, is_inverted = false):	
	if is_inverted:
		pointer.position = Vector2(column_width / 2, column_height + 64)
		pointer.scale.y = -1
	else:
		pointer.position = Vector2(column_width / 2, -64)
	
	add_child(pointer)

func remove_pointer(pointer: Pointer):
	remove_child(pointer)

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
