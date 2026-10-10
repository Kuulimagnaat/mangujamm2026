extends Node2D

var mõõt
var timer

var nr
var vastus
var variandid

var valikustseen
var valik1
var valik2
var valik3

var eseme_asukohad = [Vector2(-400,300), Vector2(0,300), Vector2(400,300)]
var hiir_masinal = false
var hiireotsas = null
var pesumasinastseen
var pesumasin
var kummitustase = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mõõt = $"Ghost-o-meter"
	mõõt.value = Global.rahulolu
	eseme_asukohad.shuffle()
	esita_valik()
	pesumasinastseen = preload("res://pesumasin.tscn")
	pesumasin = pesumasinastseen.instantiate()
	add_child(pesumasin)
# Called every frame. 'delta' is the elapsed time since the previous frame.

# 1 tähendab menüüs olemist.
# 0 tähendab mängu kinnipanemist.
# 2 tähendab mängu menüüst mängima liikumise protsessi (kestab ainult mõnd aega).
# 3 tähendab mängus olemist.
var olek = 1
func _process(delta: float) -> void:
	if olek == 1:
		pass
		
	Global.rahulolu -= kummitustase*delta
	kummitustase += 2*delta
	mõõt.value = Global.rahulolu
func esita_valik():
	if valik1 != null:
		valik1.queue_free()
	if valik2 != null:
		valik2.queue_free()
	if valik3 != null:
		valik3.queue_free()
	nr = randi_range(0,2)
	$Tekstimull.text = Global.küsimus1[nr]
	variandid = Global.vastus1
	vastus = Global.vastus1[nr]
	
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
