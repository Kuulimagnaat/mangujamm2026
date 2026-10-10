extends Node

var rahulolu
#Number küsimuse taga: Esimene näitab taset, teine numbrit, eristamiseks.
#var võimalikud_küsimused = [küsimus1, küsimus2, küsimus3]
var küsimus1 = ["Rohelist", "Sinist", "Punast"]
var vastus1 = [load("res://Masinasse/roheline_sark.png"), load("res://Masinasse/Sinised teksad.png"), load("res://Masinasse/punased_sokid.png")]
var küsimus2 = ["Triibulist", "Täpilist", "Ruudulist"]
var vastus2 
var küsimus3 = ["Särki", "Pükse", "Sokke"]
var küsimus4 = ["Riiete hoidmiseks", "Mulle juua", "Sooja"]
var küsimus5 = ["Armsat", "Hirmsat", "Veidrat"]
var küsimus6 = ["Eriti augulist", "Keskmiselt augulist", "Aukudeta"]
var küsimus7 = ["Pulma", "Matusele", "Sünnitusele"]
var küsimus8 = ["Süüa", "Meelelahutuseks", "Magamiseks"] #Sleeping pills
var küsimus9 = ["Tulevikust", "Vana", "Tänapäevast"]
var küsimus10 = ["Kasulikku", "Ilusat", "Olulist"]
var küsimus11 = ["Ägeduseks", "Kiiruseks", "Mugavuseks"]
var küsimus12 = ["Veest", "Õhust", "Maast"]
var küaimus13 = ["Tehnoloogilist", "Primitiivset", "Keskaegset"]


var küsimus42 = [""]
#Vastustesse lähevad lihtsalt textuurid


func _ready() -> void:
	rahulolu = 50
