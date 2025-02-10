extends Node2D
class_name PersistentStorage

const FILE_NAME = "user://id.save"

func clear_id():
	FileAccess.open(FILE_NAME, FileAccess.WRITE)

func save_id(id):
	var file = FileAccess.open(FILE_NAME, FileAccess.WRITE)
	file.store_64(id)

func get_id():
	if FileAccess.file_exists(FILE_NAME):
		var file = FileAccess.open(FILE_NAME, FileAccess.READ)
		
		var player_id = file.get_64()
		
		if player_id == 0:
			print("id is missing, creating a new one")
			return null
			
		return player_id
	else:
		print("id is missing, creating a new one")
		return null

