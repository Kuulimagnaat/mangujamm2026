extends Node2D

var lohistab = false
var hiir_valikul = false
var og_pos
var vanem
var õige = false
var keerleb
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	vanem = get_parent()
	z_index = 8
	$Area2D.mouse_entered.connect(hiirekontroll)
	$Area2D.mouse_exited.connect(hiirekontroll)
	scale*=0.8
func hiirekontroll():
	if hiir_valikul == true and not Input.is_action_pressed("Vasak_Hiir"):
		hiir_valikul = false
	elif hiir_valikul == false:
		hiir_valikul = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hiir_valikul == true and Input.is_action_pressed("Vasak_Hiir"):
		var tween = get_tree().create_tween()
		tween.tween_property($".", "position", Vector2(get_global_mouse_position()),0.04)
		lohistab = true
	elif lohistab == true:
		self.global_position = get_global_mouse_position()	
	if Input.is_action_just_released("Vasak_Hiir") and lohistab == true:
		if vanem.hiir_masinal == true:
			keerleb = true
			lohistab = false
		else:
			var tween = get_tree().create_tween()
			tween.tween_property($".", "position", Vector2(og_pos), 0.4)
			lohistab = false
		
	if keerleb == true:
		var tween = get_tree().create_tween()
		tween.tween_property($".","position", get_parent().get_node("Pesumasin").position, 0.2)
		rotation += 3*delta
		scale.y -=0.5*delta
		scale.x -=0.5*delta
		self.modulate.a -= 1*delta
		if self.modulate.a <= 0:
			masinasse()
func masinasse():
	if õige == true:
		Global.rahulolu += 20
		vanem.kummitustase = 1
	else:
		Global.rahulolu -= 10
	vanem.esita_valik()
	
