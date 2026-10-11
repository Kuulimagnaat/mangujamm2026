extends Node2D

var mõõt
var timer

var nr
var vastus
var valikud

var valikunumber = -1

var valikustseen
var valik1
var valik2
var valik3

var eseme_asukohad = [Vector2(-400,1000), Vector2(0,1000), Vector2(400,1000)]
var hiir_masinal = false
var hiireotsas = null
var pesumasinastseen
var pesumasin
var kummitustase = 2
var rahulolutase = 3

var teksti_kiirus = 0.02
var küsimus
var variandid

@onready var outofroomfx = AudioServer.get_bus_index("outofroomfx")
@onready var eq = AudioServer.get_bus_effect(outofroomfx, 0)



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$Menuu/Mangi.pressed.connect(MängiNupuVajutusel)
	
	#mõõt = $"Ghost-o-meter"
	mõõt = $"Progress/Ghost-o-meter"
	mõõt.value = Global.rahulolu
	eseme_asukohad.shuffle()
	$Tekstimull.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.

# 1 tähendab menüüs olemist.
# 0 tähendab mängu kinnipanemist.
# 2 tähendab mängu menüüst mängima liikumise protsessi (kestab ainult mõnd aega).
# 3 tähendab mängus olemist.
var olek = 2
# Aeg sekundites, mis kulub, et menüüst liikude mängu.
var menüüstMänguT = 1
var menüüstMängut = 0

func eemalda_riided():
	var tween = create_tween()
	tween.set_parallel()
	if valik1.keerleb == false:
		tween.tween_property(valik1, "position", Vector2(valik1.position.x,1000),0.4)
	if valik2.keerleb == false:
		tween.tween_property(valik2, "position", Vector2(valik2.position.x,1000),0.4)
	if valik3.keerleb == false:
		tween.tween_property(valik3, "position", Vector2(valik3.position.x,1000),0.4)
func MängiNupuVajutusel():
	$AnimationPlayer.play("MenüüstMängu")
	await get_tree().create_timer(3).timeout
	olek = 3
	esita_valik()


var eq_tween: Tween
func audioFX_change():
	if eq_tween and eq_tween.is_running():
		eq_tween.kill()
	
	eq_tween = create_tween()
	var time = 1.5
	
	#var current_gain = eq_effect.get_band_gain_db(band_index)
	eq_tween.set_parallel(true)
	
	for i in range(eq.get_band_count()):
		eq_tween.tween_method(func(value: float): eq.set_band_gain_db(i, value), eq.get_band_gain_db(i), 0, time).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	
	eq_tween.tween_method(func(v:float): AudioServer.set_bus_volume_db(outofroomfx, linear_to_db(v)), AudioServer.get_bus_volume_linear(outofroomfx), 0.2, time).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)

	eq_tween.tween_property($audioplayers/shelfrattling, "volume_db", -80, time)
	#$audioplayers/shelfrattling.stop()
	
	
	
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("lisa"):
		valikunumber += 1
	if olek == 3:
		
		Global.rahulolu -= kummitustase*delta
		kummitustase += 0.5*delta
		mõõt.value = Global.rahulolu
		
		if mõõt.value > 100:
			mõõt.value = 100
		if mõõt.value <= 0:
			kaotad()
func esita_valik():
	valikunumber += 1
	if valik1 != null:
		valik1.queue_free()
	if valik2 != null:
		valik2.queue_free()
	if valik3 != null:
		valik3.queue_free()
	nr = randi_range(0,2)
	küsimus = Global.küs[valikunumber][nr][0]
	lisa_tekst(küsimus)
	variandid =  [Global.küs[valikunumber][0][1], Global.küs[valikunumber][1][1], Global.küs[valikunumber][2][1]]
	vastus = Global.küs[valikunumber][nr][1]
	
	valikustseen = preload("res://lohistatav_valik.tscn")
	
	valik1 = valikustseen.instantiate()
	add_child(valik1)
	valik1.position = eseme_asukohad[0]
	valik1.og_pos = valik1.position
	
	valik1.get_child(1).texture = load(variandid[0])
	
	valik2 = valikustseen.instantiate()
	add_child(valik2)
	valik2.position = eseme_asukohad[1]
	valik2.og_pos = valik2.position
	
	valik2.get_child(1).texture = load(variandid[1])
	
	valik3 = valikustseen.instantiate()
	add_child(valik3)
	valik3.position = eseme_asukohad[2]
	valik3.og_pos = valik3.position
	valik3.get_child(1).texture = load(variandid[2])

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
func lisa_tekst(küsimus):
	$Tekstimull.visible = true
	$Tekstimull.text = küsimus
	$Tekstimull.visible_characters = 0
	for i in range($Tekstimull.text.length()):
		$Tekstimull.visible_characters = i+1
		await get_tree().create_timer(teksti_kiirus).timeout

func kaotad():
	Global.rahulolu = 50
	get_tree().reload_current_scene()
	


func _on_button_pressed() -> void:
	audioFX_change()
	MängiNupuVajutusel()


func _on_exit_button_pressed() -> void:
	get_tree().quit()
