extends Node2D
class_name Controller

var network_client: NetworkClient

func inject_network_client(new_network_client):
	network_client = new_network_client

func get_response_body(response):
	var json = JSON.new()
	
	json.parse(response[3].get_string_from_utf8())
	
	var data = json.get_data()
	
	return data
	
