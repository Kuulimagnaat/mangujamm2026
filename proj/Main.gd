extends Node2D

var mõõt
var timer
var kummitab = true

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
	pass
