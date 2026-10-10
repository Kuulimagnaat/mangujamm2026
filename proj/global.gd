extends Node

var rahulolu
#Number küsimuse taga: Esimene näitab taset, teine numbrit, eristamiseks.
#var võimalikud_küsimused = [küsimus1, küsimus2, küsimus3]
var küsimus1 = ["Rohelist", "Sinist", "Punast"]
var vastus1 = [load("res://Placeholder/green.png"), load("res://Placeholder/blu.png"), load("res://Placeholder/Red.png")]
#var küsimus12 = ["Triibulist", "Täpilist", "Ruudulist"]
#var vastus12 
#var küsimus13 = ["Särki", "Pükse", "Sokke"]
#var küsimus14 = ["Moodset", "Vana", "Tänapäevast"]

#var küsimus21 = ["Midagi armsat", "Midagi ohtlikku", "Midagi "]
#Vastustesse lähevad lihtsalt textuurid


func _ready() -> void:
	rahulolu = 50
