extends Node2D
class_name ScoreDrawer

var font = load("res://assets/fonts/fffforward.ttf")

var store

func set_store(new_store):
	store = new_store

func _draw():
	var x = get_viewport_rect().size.x
	var y = get_viewport_rect().size.y / 2
	
	draw_string(
		font, 
		Vector2(200, y), 
		str(store.get_wizard_cat_score()),
		HORIZONTAL_ALIGNMENT_CENTER, 
		90, 
		62
	)
	
	draw_string(
		font, 
		Vector2(x - 300, y), 
		str(store.get_crocoboy_score()),
		HORIZONTAL_ALIGNMENT_CENTER, 
		90, 
		62
	)
