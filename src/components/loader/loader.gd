extends Node2D
class_name Loader

func _ready():
	visible = false
	
	position.x = get_viewport_rect().size.x / 2
	position.y = get_viewport_rect().size.y / 2
	
	$Label.size.x = get_viewport_rect().size.x
	$Label.position.x = -get_viewport_rect().size.x / 2
	$Label.position.y = 100

func set_text(new_text):
	$Label.text = new_text

func show_loader():
	visible = true
	$AnimationPlayer.play("loading_animation")

func hide_loader():
	visible = false
	$AnimationPlayer.stop()
