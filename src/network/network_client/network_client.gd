extends Node
class_name NetworkClient

var http_request = HTTPRequest.new()

var headers = ["Content-Type: application/json", "Access-Control-Allow-Origin: *"]

func _ready():
	add_child(http_request)

func get_request(url):
	var error = http_request.request(url, headers, HTTPClient.METHOD_GET)
	
	if error != OK:
		push_error("An error occurred in the GET request to: " + url)
		return
		
	var response = await http_request.request_completed
	
	if response[1] >= 200 && response[1] <= 299:
		return response
	
	push_error("An error occurred in the GET request to: " + url)
	return

func post_request(url, body):
	var error = http_request.request(url, headers, HTTPClient.METHOD_POST, body)
	
	if error != OK:
		push_error("An error occurred in the POST request to: " + url + " with body: " + body)
		return

	var response = await http_request.request_completed
		
	if response[1] >= 200 && response[1] <= 299:
		return response
	
	push_error("An error occurred in the POST request to: " + url + " with body: " + body)
	return

