extends Node

var rahulolu
#var võimalikud_küsimused = [küsimus1, küsimus2, küsimus3]
var küsimus1 = ["Ohverda meile midagi rohelist", "Ohverda meile midagi sinist", "Ohverda meile midagi punast"]
var vastus1 = [load("res://Placeholder/green.png"), load("res://Placeholder/blu.png"), load("res://Placeholder/Red.png")]
#Vastustesse lähevad lihtsalt textuurid


func _ready() -> void:
	rahulolu = 50
