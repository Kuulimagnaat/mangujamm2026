extends Node2D

var mõõt
var timer
var kummitab = true
var valikustseen
var valik
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mõõt = $"Ghost-o-meter"
	mõõt.value = Global.rahulolu
	esita_valik()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if kummitab == true:
		Global.rahulolu -= 2*delta
		mõõt.value = Global.rahulolu
func esita_valik():
	valikustseen = preload("res://lohistatav_valik.tscn")
	valik = valikustseen.instantiate()
	add_child(valik)
