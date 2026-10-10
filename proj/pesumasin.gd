extends Sprite2D

var välimus1
var välimus2
var välimus3
var välimus4
var välimus5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	välimus1 = load("res://Joonistused/Ajutine pesumasin.png")
	välimus2 = load("res://Joonistused/AP2.png")
	välimus3 = load("res://Joonistused/AP3.png")
	välimus4 = load("res://Joonistused/AP4.png")
	välimus5 = load("res://Joonistused/AP5.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.rahulolu < 20:
		texture = välimus1
	elif Global.rahulolu >=20 and Global.rahulolu<40:
		texture = välimus2
	elif Global.rahulolu >=40 and Global.rahulolu<60:
		texture = välimus3
	elif Global.rahulolu >=60 and Global.rahulolu<80:
		texture = välimus4
	elif Global.rahulolu >=80 and Global.rahulolu<=100:
		texture = välimus5
		
