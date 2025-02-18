extends Node2D
class_name KnucklebonesMainScreen

const HORIZONTAL_OFFSET = 300
const VERTICAL_OFFSET = 400

var current_pointer_position = 1

@onready var wizard_cat = $WizardCat
@onready var crocoboy = $Crocoboy
@onready var store = $KnucklebonesStore
@onready var score_drawer = $ScoreDrawer
@onready var desk = $Desk

# TODO: надо подумать это вообще норм тема или нет
# там просто много get_parent() вызывается
@onready var dice_utils = $DiceUtils
@onready var desk_utils = $DeskUtils
@onready var pointer_utils = $PointerUtils

func _ready():
	randomize()
	
	init_players()
	
	score_drawer.set_store(store)
	
	# TODO: write logic to assign specific user to a character

func _input(_ev):
	# if IS YOUR MOVE then allow these stuff, otherwise dont
	#if $KnucklebonesStore.is_wizards_cats_move() && true:
		#return
	#if $KnucklebonesStore.is_crocoboys_move() && true:
		#return

	if store.is_in_throwing_state():
		if Input.is_action_just_released("Action"):
			throw_dice()
	elif store.is_in_selecting_column_state():
		if Input.is_action_just_released("Left"):
			pointer_utils.move_pointer_left()
		elif Input.is_action_just_released("Right"):
			pointer_utils.move_pointer_right()
		elif Input.is_action_just_released("Action"):
			put_dice()

func init_players():
	wizard_cat.position.x = HORIZONTAL_OFFSET
	wizard_cat.position.y = get_viewport_rect().size.y - VERTICAL_OFFSET
	
	crocoboy.position.x = get_viewport_rect().size.x - HORIZONTAL_OFFSET
	crocoboy.position.y = VERTICAL_OFFSET

func put_dice():
	var columns: Array[Column] = desk_utils.get_columns()
	
	if !columns[current_pointer_position - 1].can_add_dice():
		return
	
	if store.is_wizards_cats_move():
		wizard_cat.run_smirk_tween()
	else:
		crocoboy.run_smirk_tween()
	
	columns[current_pointer_position - 1].remove_pointer(pointer_utils.pointer_instance)
	
	pointer_utils.pointer_instance.delete_pointer()
	
	remove_child(dice_utils.dice_instance)
	
	columns[current_pointer_position - 1].add_dice(dice_utils.dice_instance)
	
	store.set_current_state(store.State.THROWING)
	
	if store.is_wizards_cats_move():
		store.set_current_player(store.Players.CROCOBOY)
	else:
		store.set_current_player(store.Players.WIZARD_CAT)

func throw_dice():
	dice_utils.create_dice()
	
	store.set_current_state(store.State.SELECTING_COLUMN)
	
	pointer_utils.create_pointer()

