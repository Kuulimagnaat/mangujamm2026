extends Node2D


func _on_button_mouse_entered() -> void:
	$Sprite2D.texture = load("res://Joonistused/enter_active.png")
	$"../audioplayers/selectplay".play(0.05)


func _on_button_mouse_exited() -> void:
	$Sprite2D.texture = load("res://Joonistused/enter.png")
