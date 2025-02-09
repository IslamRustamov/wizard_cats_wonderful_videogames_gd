extends Node2D
class_name Desk

var column_width = 200
var column_height = 600

var second_column_x_offset = 300
var third_column_x_offset = 600

var line_width = 10

func _ready():
	var x = get_viewport_rect().size.x / 2 - 400
	var y = get_viewport_rect().size.y / 2 - 300
	
	$ColumnOne.position.x = x
	$ColumnOne.position.y = y
	
	$ColumnTwo.position.x = x + second_column_x_offset
	$ColumnTwo.position.y = y
	
	$ColumnThree.position.x = x + third_column_x_offset
	$ColumnThree.position.y = y

func _draw():
	draw_rect(
		Rect2(
			$ColumnOne.position.x, 
			$ColumnOne.position.y, 
			column_width, 
			column_height
		), 
		Color.WHITE, 
		false, 
		line_width
	)
	
	draw_rect(
		Rect2(
			$ColumnTwo.position.x, 
			$ColumnTwo.position.y, 
			column_width, 
			column_height
		), 
		Color.WHITE, 
		false, 
		line_width
	)
	
	draw_rect(
		Rect2(
			$ColumnThree.position.x, 
			$ColumnThree.position.y, 
			column_width, 
			column_height
		), 
		Color.WHITE, 
		false, 
		line_width
	)

