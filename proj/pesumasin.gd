extends Sprite2D

var väimus1 = load("res://Joonistused/Ajutine pesumasin.png")
var väimus2 = load("res://Joonistused/Ajutine pesumasin.png")
var väimus3 = load("res://Joonistused/Ajutine pesumasin.png")
var väimus4 = load("res://Joonistused/Ajutine pesumasin.png")
var väimus5 = load("res://Joonistused/Ajutine pesumasin.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.rahulolu < 20:
		texture = väimus1
		
