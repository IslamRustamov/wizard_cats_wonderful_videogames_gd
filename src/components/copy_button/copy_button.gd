extends Node2D
class_name CopyButton

var text_to_copy = ""

func set_text_to_copy(text):
	text_to_copy = text

func _draw():
	var rect_one: Rect2 = Rect2(Vector2(20, 30), Vector2(40, 60))
	var rect_two: Rect2 = Rect2(Vector2(40, 10), Vector2(40, 60))
	
	draw_rect(rect_one, Color.WHITE, false, 5)
	draw_rect(rect_two, Color.WHITE, false, 5)

func _on_button_pressed():
	DisplayServer.clipboard_set(text_to_copy)
