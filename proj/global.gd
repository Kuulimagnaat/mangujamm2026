extends Node

var rahulolu
#Number küsimuse taga: Esimene näitab taset, teine numbrit, eristamiseks.
var võimalikud_küsimused = [küsimus1, küsimus2, küsimus3, küsimus4, küsimus5, küsimus6, küsimus7, küsimus8, küsimus9, küsimus10, küsimus11, küsimus11, küsimus11, küsimus12
, küsimus12, küsimus13, küsimus14, küsimus15, küsimus16, küsimus17, küsimus18, küsimus19, küsimus20]
var küsimus1 = ["Rohelist", "Sinist", "Punast"]
var vastus1 = [load("res://Masinasse/roheline_sark.png"), load("res://Masinasse/Sinised teksad.png"), load("res://Masinasse/punased_sokid.png")]
var küsimus2 = ["Triibulist", "Täpilist", "Ruudulist"]
var vastus2 = [load("res://Masinasse/triibuline_sark.png"),load("res://Masinasse/triibulised_sokid.png"),load("res://Masinasse/ruuduline_sark.png")]
var küsimus3 = ["Särki", "Pükse", "Sokke"]
#var vastus3 = [load(),load(),load()]
var küsimus4 = ["Riiete hoidmiseks", "Mulle juua", "Sooja"]
#var vastus4 = [load(),load(),load()]
var küsimus5 = ["Armsat", "Hirmsat", "Veidrat"]
var vastus5 = [load("res://Masinasse/kassisark.png"),load("res://Masinasse/krokodillisark.png"),load("res://Masinasse/nokkloomasark.png")]
var küsimus6 = ["Eriti augulist", "Keskmiselt augulist", "Aukudeta"]
#var vastus6 = [load("res://Masinasse/AUKLIKUD_SOKID.png"),load(),load()]
var küsimus7 = ["Pulma", "Matusele", "Sünnitusele"]
#var vastus7 = [load(),load(),load()]
var küsimus8 = ["Süüa", "Meelelahutuseks", "Magamiseks"] #Sleeping pills
#var vastus8 = [load(),load(),load()]
var küsimus9 = ["Tulevikust", "Vana", "Tänapäevast"]
#var vastus9 = [load(),load(),load()]
var küsimus10 = ["Kasulikku", "Ilusat", "Olulist"]
#var vastus10 = [load(),load(),load()]
var küsimus11 = ["Ägeduseks", "Kiiruseks", "Mugavuseks"]
#var vastus11 = [load(),load(),load()]
var küsimus12 = ["Veest", "Õhust", "Maast"]
#var vastus12 = [load(),load(),load()]
var küsimus13 = ["Jumalateenistuseks", "Juubeliks", "Midagi peale visata"]
var vastus13 = [load("res://Masinasse/hakama.png"),load("res://Masinasse/kimono.png"),load("res://Masinasse/haori.png")]
var küsimus14 = ["Tehnoloogilist", "Primitiivset", "Keskaegset"]
#var vastus14 = [load(),load(),load()]
var küsimus15 = ["Armsat", "Armsat", "Armsat"]
#var vastus15 = [load(),load(),load()]
var küsimus16 = ["Väärtuslikku", "Arvepaberid", "Bitcoin"]
#var vastus16 = [load(),load(),load()]
var küsimus17 = ["Lahinguks", "Soojaks", "Stiiliks"]
#var vastus17 = [load(),load(),load()]
var küsimus18 = ["Sinu suurim saladus"]
#var vastus18 = [load(),load(),load()]
var küsimus19 = ["Mustvalget", "Vastmulget", "Täielikku tasakaalu"]
var vastus19 = [load("res://Masinasse/mustad_sokid_valgete_triipudega.png"),load("res://Masinasse/valged_sokid_mustade_triipudega.png"),load("res://Masinasse/mustvalged_sokid.png")]
var küsimus20 = ["Iseend"]
#var vastus20 = [load(),load(),load()]
#Vastustesse lähevad lihtsalt textuurid


func _ready() -> void:
	rahulolu = 50
