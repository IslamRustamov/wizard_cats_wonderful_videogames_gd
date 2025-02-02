extends Controller
class_name GamesController

func get_games():
	var response = await network_client.get_request("http://127.0.0.1:3000/games")
	
	if response != null:
		var body = get_response_body(response)
		
		if body && body.has("games"):
			return body.games

	return []

