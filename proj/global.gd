extends Node

var rahulolu
var küs

func _ready() -> void:
	rahulolu = 50
	var file = FileAccess.open("res://Küsimused.json", FileAccess.READ)
	var json_string = file.get_as_text()
	var json = JSON.new()
	var result = json.parse(json_string)
	var andmed = json.data
	küs = andmed["küs"]
	
	
