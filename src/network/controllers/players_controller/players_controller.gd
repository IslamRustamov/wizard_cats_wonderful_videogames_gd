extends Controller
class_name PlayersController

func create_player():
	var response = await network_client.post_request("http://127.0.0.1:3000/players")

	if response != null:
		var response_body = get_response_body(response)
		
		return response_body.player_id
	else:
		return null
