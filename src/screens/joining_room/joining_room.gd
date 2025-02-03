extends Node2D
class_name JoiningRoom

func _on_button_pressed():
	$CenterContainer/VBoxContainer/Button.disabled = true

	GameStore.set_room_password($CenterContainer/VBoxContainer/LineEdit.text)
	
	NavigationService.open_waiting_room_screen()
