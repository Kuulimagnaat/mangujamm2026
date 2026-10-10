extends Node2D

var mõõt
var timer
var kummitab = true

var valikustseen
var valik1
var valik2
var valik3

var hiir_masinal = false
var pesumasinastseen
var pesumasin

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mõõt = $"Ghost-o-meter"
	mõõt.value = Global.rahulolu
	esita_valik()
	pesumasinastseen = preload("res://pesumasin.tscn")
	pesumasin = pesumasinastseen.instantiate()
	add_child(pesumasin)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if kummitab == true:
		Global.rahulolu -= 2*delta
		mõõt.value = Global.rahulolu
func esita_valik():
	valikustseen = preload("res://lohistatav_valik.tscn")
	
	valik1 = valikustseen.instantiate()
	add_child(valik1)
	valik1.position.x += 400
	valik1.position.y += 300
	valik1.og_pos = valik1.position
	
	valik2 = valikustseen.instantiate()
	add_child(valik2)
	valik2.position.x -= 400
	valik2.position.y += 300
	valik2.og_pos = valik2.position
	
	valik3 = valikustseen.instantiate()
	add_child(valik3)
	valik3.position.y += 300
	valik3.og_pos = valik3.position
	
func hiirekontroll():
	if hiir_masinal == true:
		hiir_masinal = false
	elif hiir_masinal == false:
		hiir_masinal = true
