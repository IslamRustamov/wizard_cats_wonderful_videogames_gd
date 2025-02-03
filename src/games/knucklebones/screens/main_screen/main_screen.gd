extends Node2D
class_name KnucklebonesMainScreen

const HORIZONTAL_OFFSET = 300
const VERTICAL_OFFSET = 400

func _ready():
	$WizardCat.position.x = HORIZONTAL_OFFSET
	$WizardCat.position.y = get_viewport_rect().size.y - VERTICAL_OFFSET
	
	$Crocoboy.position.x = get_viewport_rect().size.x - HORIZONTAL_OFFSET
	$Crocoboy.position.y = VERTICAL_OFFSET
