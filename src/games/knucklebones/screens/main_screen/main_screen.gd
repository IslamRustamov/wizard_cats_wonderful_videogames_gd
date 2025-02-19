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
@onready var dice_utils: DiceUtils = $DiceUtils
@onready var desk_utils: DeskUtils = $DeskUtils
@onready var pointer_utils: PointerUtils = $PointerUtils

func _ready():
	randomize()
	
	init_players()
	
	score_drawer.set_store(store)

func _input(_ev):
	var am_i_wizard_cat = PlayerStore.get_player_id() == ConnectionStore.get_connected_players_ids()[0]
	
	if am_i_wizard_cat && !store.is_wizards_cats_move():
		return

	# !am_i_wizard_cat === crocoboy
	if !am_i_wizard_cat && !store.is_crocoboys_move():
		return

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
	
	run_smirk_tween()
	
	columns[current_pointer_position - 1].remove_pointer(pointer_utils.pointer_instance)
	
	pointer_utils.pointer_instance.delete_pointer()
	
	remove_child(dice_utils.dice_instance)
	
	columns[current_pointer_position - 1].add_dice(dice_utils.dice_instance)
	
	store.set_current_state(store.State.THROWING)
	
	change_current_player()
		
	current_pointer_position = 1
	
	# ТЫ БРОСИЛ ТУТ
	# 1. нужно отправлять все необходимые данные о шаге
	#    - куда положил кость и какую
	# 2. нужно принимать ответ от бэка
	ActionCable.send_game_step(GameStore.get_room_id(), {"HELLOOOO": "HIIIII"})
	
func run_smirk_tween():
	if store.is_wizards_cats_move():
		wizard_cat.run_smirk_tween()
	else:
		crocoboy.run_smirk_tween()

func change_current_player():
	if store.is_wizards_cats_move():
		store.set_current_player(store.Players.CROCOBOY)
	else:
		store.set_current_player(store.Players.WIZARD_CAT)

func throw_dice():
	dice_utils.create_dice()
	
	store.set_current_state(store.State.SELECTING_COLUMN)
	
	pointer_utils.create_pointer()

