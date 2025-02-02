extends Node2D
class_name JoiningRoom

func _on_button_pressed():
	$Button.disabled = true

	GameStore.set_room_password($LineEdit.text)
	
	NavigationService.open_waiting_room_screen()
