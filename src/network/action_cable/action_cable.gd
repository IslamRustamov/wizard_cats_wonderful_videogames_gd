extends Controller

var socket = WebSocketPeer.new()

signal game_step(message)

func _ready():
	set_process(false)

func connect_to_url(player_id):
	socket.connect_to_url(
		"ws://127.0.0.1:3000/cable?player_id={player_id}"
			.format({"player_id": player_id})
	)
	
	set_process(true)

func subscribe_to_room(room_id):
	socket.send_text(create_websocket_message("subscribe", {"channel": "RoomChannel", "room_id": room_id}))

func send_game_step(room_id, data):
	socket.send_text(create_websocket_message("message", {"channel": "RoomChannel", "room_id": room_id}, data))

func create_websocket_message(command, identifier, data = null):
	return JSON.stringify({
		"command": command,
		"identifier": JSON.stringify(identifier),
		"data": JSON.stringify(data)
	})

func _process(_delta):
	socket.poll()
	
	var state = socket.get_ready_state()
	
	if state == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count():
			var packet = socket.get_packet()
			var body = get_websocket_packet_body(packet)
			
			print(body)
			
			if body.has("type") && body.type == "ping":
				pass
			elif body.has("type") && body.type == "welcome":
				handle_connection_to_websocket_message()
			elif body.has("message") && body.message.has("type"):
				if body.message.type == "player_connected":
					handle_game_start_message(body.message)
				elif body.message.type == "player_left":
					handle_player_left_message(body.message)
				elif body.message.type == "game_step":
					handle_game_step(body.message)
	elif state == WebSocketPeer.STATE_CLOSING:
		pass
	elif state == WebSocketPeer.STATE_CLOSED:
		var code = socket.get_close_code()
		var reason = socket.get_close_reason()
		print("WebSocket closed with code: %d, reason %s. Clean: %s" % [code, reason, code != -1])
		set_process(false)

func handle_connection_to_websocket_message():
	subscribe_to_room(GameStore.get_room_id())
	
func handle_game_start_message(message):
	ConnectionStore.set_connected_players_ids(message.data.player_ids)

func handle_game_step(message):
	game_step.emit(message)

func handle_player_left_message(_message):
	pass
