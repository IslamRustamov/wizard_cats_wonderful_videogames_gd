extends Node2D
class_name WizardCat

func _ready():
	# maybe do something with idle animation?
	$AnimationPlayer.play("idle")
	$DebugButton.visible = false
	
	# for debugging
	position.x = get_viewport_rect().size.x / 2
	position.y = get_viewport_rect().size.y / 2
	$DebugButton.visible = true
	$DebugButton.position.y = position.y - 400
	
func make_move():
	$AnimationPlayer.play("smirk", 0.2)

func _on_debug_button_pressed():
	make_move()

func _on_animation_player_idle_animation_finished(anim_name):
	if anim_name == "smirk":
		$AnimationPlayer.play("idle", 0.1)
