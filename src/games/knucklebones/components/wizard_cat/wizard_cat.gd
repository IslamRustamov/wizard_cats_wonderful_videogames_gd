extends Node2D
class_name WizardCat

func _ready():
	$DebugButton.visible = false
	
	$AnimatedSprite2D.run_idle_tween()
	
	# for debugging
	#position.x = get_viewport_rect().size.x / 2
	#position.y = get_viewport_rect().size.y / 2
	$DebugButton.visible = true
	#$DebugButton.position.y = position.y - 400

func _on_debug_button_pressed():
	queue_redraw()
	$AnimatedSprite2D.run_smirk_tween()

func run_smirk_tween():
	$AnimatedSprite2D.run_smirk_tween()
