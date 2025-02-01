extends Controller
class_name RoomsController

func create_room(body):
	var stringified_body = JSON.stringify(body)

	var response = await network_client.post_request("http://127.0.0.1:3000/rooms", stringified_body)
	
	if response != null:
		var response_body = get_response_body(response)
		print(response_body)
		
		# TODO: CHANGE THIS
		return null
	else:
		return []


