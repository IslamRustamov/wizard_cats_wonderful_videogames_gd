extends Node2D
class_name Desk

func get_wizard_cats_columns() -> Array[Column]:
	return [
		$WizardCatsTable/CenterContainer/HBoxContainer/Control/ColumnOne,
		$WizardCatsTable/CenterContainer/HBoxContainer/Control2/ColumnTwo,
		$WizardCatsTable/CenterContainer/HBoxContainer/Control3/ColumnThree,
	]

func get_crocoboys_columns() -> Array[Column]:
	return [
		$CrocoboysTable/CenterContainer/HBoxContainer/Control/ColumnOne,
		$CrocoboysTable/CenterContainer/HBoxContainer/Control2/ColumnTwo,
		$CrocoboysTable/CenterContainer/HBoxContainer/Control3/ColumnThree,
	]

func set_pointer_for_wizard_cats_table(pointer: Pointer, column: Column):
	if column == $WizardCatsTable/CenterContainer/HBoxContainer/Control/ColumnOne:
		column.set_pointer(pointer)
