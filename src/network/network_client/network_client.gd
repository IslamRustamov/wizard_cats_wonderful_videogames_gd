extends Node
class_name NetworkClient

var http_request = HTTPRequest.new()

func _ready():
	add_child(http_request)

func get_request(url):
	var error = http_request.request(url)
	
	if error != OK:
		push_error("An error occurred in the HTTP request to: " + url)
		return
		
	var response = await http_request.request_completed
	
	return response

func post_request(url, body):
	var headers = ["Content-Type: application/json"]

	var error = http_request.request(url, headers, HTTPClient.METHOD_POST, body)
	
	if error != OK:
		push_error("An error occurred in the HTTP request to: " + url + " with body: " + body)
		return

	var response = await http_request.request_completed
	
	return response

