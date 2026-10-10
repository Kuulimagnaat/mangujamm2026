extends Node2D

var mõõt
var timer

var nr
var vastus

var valikunumber = -1

var valikustseen
var valik1
var valik2
var valik3

var eseme_asukohad = [Vector2(-400,300), Vector2(0,300), Vector2(400,300)]
var hiir_masinal = false
var hiireotsas = null
var pesumasinastseen
var pesumasin
var kummitustase = 3
var rahulolutase = 3

var teksti_kiirus = 0.1
var küsimus
var variandid

var mental
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Menuu/Mangi.pressed.connect(MängiNupuVajutusel)
	mõõt = $"Ghost-o-meter"
	mõõt.value = Global.rahulolu
	mental = $"Mental meter"
	mental.value = Global.mental
	eseme_asukohad.shuffle()
	mõõt.visible = false
	mental.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.

# 1 tähendab menüüs olemist.
# 0 tähendab mängu kinnipanemist.
# 2 tähendab mängu menüüst mängima liikumise protsessi (kestab ainult mõnd aega).
# 3 tähendab mängus olemist.
var olek = 2
# Aeg sekundites, mis kulub, et menüüst liikude mängu.
var menüüstMänguT = 1
var menüüstMängut = 0

func MängiNupuVajutusel():
	$AnimationPlayer.play("MenüüstMängu")
	olek = 2
	

	
func _process(delta: float) -> void:

	if olek == 3:
		Global.rahulolu -= kummitustase*delta
		kummitustase += 1.5*delta
		mõõt.value = Global.rahulolu
	
		Global.mental += rahulolutase*delta
		mental.value = Global.mental
	
	if mental.value <= 0:
		kaotad()
	if mõõt.value > 100:
		mõõt.value = 100
	if mõõt.value <= 0:
		karista()
func esita_valik():
	valikunumber += 1
	if valik1 != null:
		valik1.queue_free()
	if valik2 != null:
		valik2.queue_free()
	if valik3 != null:
		valik3.queue_free()
	nr = randi_range(0,2)
	küsimus = Global.võimalikud_küsimused[valikunumber]
	lisa_tekst()
	variandid = Global.võimalikud_vastused[valikunumber]
	vastus = variandid[nr]
	
	valikustseen = preload("res://lohistatav_valik.tscn")
	
	valik1 = valikustseen.instantiate()
	add_child(valik1)
	valik1.position = eseme_asukohad[0]
	valik1.og_pos = valik1.position
	
	valik1.get_child(1).texture = variandid[0]
	
	valik2 = valikustseen.instantiate()
	add_child(valik2)
	valik2.position = eseme_asukohad[1]
	valik2.og_pos = valik2.position
	
	valik2.get_child(1).texture = variandid[1]
	
	valik3 = valikustseen.instantiate()
	add_child(valik3)
	valik3.position = eseme_asukohad[2]
	valik3.og_pos = valik3.position
	valik3.get_child(1).texture = variandid[2]
	
	if nr == 0:
		valik1.õige = true
	elif nr == 1:
		valik2.õige = true
	elif nr ==2:
		valik3.õige = true
func hiirekontroll():
	if hiir_masinal == true:
		hiir_masinal = false
	elif hiir_masinal == false:
		hiir_masinal = true
func lisa_tekst():
	$Tekstimull.text = str(küsimus[nr])
	$Tekstimull.visible_characters = 0
	for i in range($Tekstimull.text.length()):
		$Tekstimull.visible_characters = i+1
		await get_tree().create_timer(teksti_kiirus).timeout
func karista():
	Global.mental -= 66
	Global.rahulolu = 50
func kaotad():
	Global.mental = 50
	Global.rahulolu = 50
	get_tree().reload_current_scene()
	
