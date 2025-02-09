extends Node2D
class_name KnucklebonesMainScreen

const HORIZONTAL_OFFSET = 300
const VERTICAL_OFFSET = 400

var dice_scene = preload("res://src/games/knucklebones/components/dice/dice.tscn")
var dice_instance = null

var current_pointer_position = 1

func _ready():
	randomize()
	
	init_players()
	
	init_pointer()
	
	init_dice()
	
	$ScoreDrawer.set_store($KnucklebonesStore)
	
	# TODO: write logic to assign specific user to a character

func _input(_ev):
	# if IS YOUR MOVE then allow these stuff, otherwise dont
	if $KnucklebonesStore.is_in_throwing_state():
		if Input.is_action_just_released("Action"):
			throw_dice()
	elif $KnucklebonesStore.is_in_selecting_column_state():
		if Input.is_action_just_released("Left"):
			$PointerUtils.move_pointer_left()
		elif Input.is_action_just_released("Right"):
			$PointerUtils.move_pointer_right()
		elif Input.is_action_just_released("Action"):
			$DiceUtils.put_dice()

func init_players():
	$WizardCat.position.x = HORIZONTAL_OFFSET
	$WizardCat.position.y = get_viewport_rect().size.y - VERTICAL_OFFSET
	
	$Crocoboy.position.x = get_viewport_rect().size.x - HORIZONTAL_OFFSET
	$Crocoboy.position.y = get_viewport_rect().size.y - VERTICAL_OFFSET

func init_pointer():
	$Pointer.hide()
	
	$Pointer.position.x = $Desk/ColumnOne.position.x + $Desk.column_width / 2
	$Pointer.position.y = $Desk/ColumnOne.position.y - 100
	
	$PointerUtils.set_parent(self)
	$PointerUtils.set_pointer($Pointer)
	$PointerUtils.set_possible_positions([
		Vector2(
			$Desk/ColumnOne.position.x + $Desk.column_width / 2, 
			$Desk/ColumnOne.position.y - 100
		),
		Vector2(
			$Desk/ColumnTwo.position.x + $Desk.column_width / 2, 
			$Desk/ColumnTwo.position.y - 100
		),
		Vector2(
			$Desk/ColumnThree.position.x + $Desk.column_width / 2, 
			$Desk/ColumnThree.position.y - 100
		),
	])

func init_dice():
	$DiceUtils.set_parent(self)
	$DiceUtils.set_possible_positions([
		Vector2(
			$Desk/ColumnOne.position.x + $Desk.column_width / 2,
			$Desk/ColumnOne.position.y
		),
		Vector2(
			$Desk/ColumnTwo.position.x + $Desk.column_width / 2,
			$Desk/ColumnTwo.position.y
		),
		Vector2(
			$Desk/ColumnThree.position.x + $Desk.column_width / 2,
			$Desk/ColumnThree.position.y
		),
	])

func throw_dice():
	if $KnucklebonesStore.is_wizards_cats_move():
		$DiceUtils.create_dice()
		
		$KnucklebonesStore.set_current_state($KnucklebonesStore.State.SELECTING_COLUMN)
		
		$Pointer.show()
		
		#$KnucklebonesStore.set_current_player($KnucklebonesStore.Players.CROCOBOY)
	else:
		print('yea again')
		#$KnucklebonesStore.set_current_player($KnucklebonesStore.Players.WIZARD_CAT)

