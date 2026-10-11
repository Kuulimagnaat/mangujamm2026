extends Node2D

var lohistab = false
var hiir_valikul = false
var og_pos
var vanem
var õige = false
var keerleb = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.set_parallel()
	tween.tween_property(self, "position:y",300, 0.5)
	vanem = get_parent()
	z_index = 8
	$Area2D.mouse_entered.connect(hiirekontroll)
	$Area2D.mouse_exited.connect(hiirekontroll)
	scale*=0.8
func hiirekontroll():
	og_pos = self.position
	if hiir_valikul == true and not Input.is_action_pressed("Vasak_Hiir"):
		hiir_valikul = false
	elif hiir_valikul == false:
		hiir_valikul = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if vanem.olek == 3:
		if hiir_valikul == true and Input.is_action_just_pressed("Vasak_Hiir"):
			var tween = get_tree().create_tween()
			tween.tween_property($".", "position", Vector2(get_global_mouse_position()),0.04)
			lohistab = true
		elif lohistab == true:
			self.global_position = get_global_mouse_position()
		if Input.is_action_just_released("Vasak_Hiir") and lohistab == true:
			if vanem.hiir_masinal == true:
				if vanem.valikunumber == 14:
					vanem.visatav = self
					vanem.play_animation()
				elif vanem.valikunumber == 19:
					vanem.play_animation()
				else:
					masinasse()
			
			else:
				var tween = get_tree().create_tween()
				tween.tween_property($".", "position", Vector2(og_pos), 0.4)
				lohistab = false
		
		if keerleb == true:
			var tween = get_tree().create_tween()
			tween.tween_property($".","position", Vector2(20,120), 0.2)
			rotation += 3*delta
			scale.y -=0.5*delta
			scale.x -=0.5*delta
			self.modulate.a -= 1*delta
			if self.modulate.a <= 0:
				vanem.esita_valik()
			
func masinasse():
	keerleb = true
	vanem.eemalda_riided()
	
	var auhind = 20
	
	if õige == true:
		Global.rahulolu = max(Global.rahulolu - auhind, 0)
		vanem.kummitustase = 1
	else:
		Global.rahulolu += 50

	
