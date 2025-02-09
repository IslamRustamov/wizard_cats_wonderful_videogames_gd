extends Node2D
class_name KnucklebonesStore

# Current player store
enum Players {WIZARD_CAT, CROCOBOY}

var current_player_move: Players = Players.WIZARD_CAT

func set_current_player(player: Players):
	current_player_move = player

func is_wizards_cats_move():
	return current_player_move == Players.WIZARD_CAT

func is_crocoboys_move():
	return current_player_move == Players.CROCOBOY
		
func get_current_player():
	return current_player_move

# Current game state store
enum State {THROWING, SELECTING_COLUMN}

var current_state = State.THROWING

func is_in_throwing_state():
	return current_state == State.THROWING

func is_in_selecting_column_state():
	return current_state == State.SELECTING_COLUMN

func set_current_state(new_state: State):
	current_state = new_state

# Score store
var wizard_cat_score = 0
var crocoboy_score = 0

func increase_wizard_cat_score(new_score):
	wizard_cat_score = wizard_cat_score + new_score

func increase_crocoboy_score(new_score):
	crocoboy_score = crocoboy_score + new_score

func get_wizard_cat_score():
	return wizard_cat_score

func get_crocoboy_score():
	return crocoboy_score
