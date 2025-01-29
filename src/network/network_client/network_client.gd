extends Node
class_name NetworkClient

var http_request = HTTPRequest.new()

func _ready():
	add_child(http_request)

func get_request(url):
	http_request.get

	var error = http_request.request(url)
	
	if error != OK:
		push_error("An error occurred in the HTTP request to: " + url)
		return
		
	var response = await http_request.request_completed
	
	return response
