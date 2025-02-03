extends Node2D
class_name Crocoboy

func _ready():
	$DebugButton.visible = false
	
	$AnimatedSprite2D.run_idle_tween()
	
	# for debugging
	position.x = get_viewport_rect().size.x / 2
	position.y = get_viewport_rect().size.y / 2
	$DebugButton.visible = true
	$DebugButton.position.y = position.y - 400

func _on_debug_button_pressed():
	$AnimatedSprite2D.run_smirk_tween()
