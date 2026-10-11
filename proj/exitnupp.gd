extends Node2D


func _on_button_mouse_entered() -> void:
	$Sprite2D.texture = load("res://Joonistused/exit_now.png")
	$"../audioplayers/GlassBreak".play(0.8)

func _on_button_mouse_exited() -> void:
	$Sprite2D.texture = load("res://Joonistused/not_exit.png")
	$"../audioplayers/glich".play()
