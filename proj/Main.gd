extends Node2D

var mõõt
var timer

var nr
var vastus
var valikud

var valikunumber = -1
var visatav
var alpha
var valikustseen
var valik1
var valik2
var valik3
var jookseb = true
var kaotasid = false

var eseme_asukohad = [Vector2(-400,1000), Vector2(0,1000), Vector2(400,1000)]
var hiir_masinal = false
var hiireotsas = null
var pesumasinastseen
var pesumasin
var kummitustase = 1.7

var teksti_kiirus = 0.02
var küsimus
var variandid

@onready var outofroomfx = AudioServer.get_bus_index("outofroomfx")
@onready var eq = AudioServer.get_bus_effect(outofroomfx, 0)

var originaleq = [0,0,0,0,0,0]



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Cutscene/Sprite2D.visible = false
	$Cutscene/Sprite2D2.visible = false
	$Cutscene/Sprite2D3.visible = false
	$"Viimane anim".visible = false
	$"Viimane pilt".visible = false
	$"Esimene kaader".visible = false
	$Valge.visible = false
	$"Menu screenshot".visible = false
	#$Menuu/Mangi.pressed.connect(MängiNupuVajutusel)
	
	#mõõt = $"Ghost-o-meter"
	mõõt = $"Progress/Ghost-o-meter"
	mõõt.value = Global.rahulolu
	
	$Tekstimull.visible = false
	
	for i in range(eq.get_band_count()):
		originaleq[i] = eq.get_band_gain_db(i)
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

func reset():
	Global.rahulolu = 50
	get_tree().reload_current_scene()
	

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
		valikunumber = 18
	if olek == 3 and jookseb == true:
		Global.rahulolu += kummitustase*delta
		kummitustase += 0.6*delta
		mõõt.value = Global.rahulolu
		if mõõt.value <= 0:
			Global.rahulolu = 0
		if mõõt.value >= 100:
			kaotad()
	if alpha == true:
		$"Viimane pilt".modulate.a += 10*delta

func play_animation():
	jookseb = false
	
	if valikunumber == 14 and kaotasid == false:
		$Cutscene/Sprite2D.visible = true
		await get_tree().create_timer(2).timeout
		$Cutscene/Sprite2D3.visible = true
		await get_tree().create_timer(2).timeout
		$Cutscene/Sprite2D2.visible = true
		await get_tree().create_timer(2).timeout
		$Cutscene/Sprite2D.visible = false
		$Cutscene/Sprite2D2.visible = false
		$Cutscene/Sprite2D3.visible = false
		visatav.masinasse()
	elif valikunumber == 19 or kaotasid == true:
		$"Esimene kaader".visible = true
		await get_tree().create_timer(0.7).timeout
		$"Viimane anim".visible = true
		$"Esimene kaader".visible = false
		$"Viimane anim".play()
		await get_tree().create_timer(5.5).timeout
		$"Viimane pilt".modulate.a = 0
		$"Viimane pilt".visible = true
		alpha = true
		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("Lõpp")
		await get_tree().create_timer(3).timeout
		$Valge.visible = true
		$"Menu screenshot".visible = true
		$AnimationPlayer.play("Fade")
		await get_tree().create_timer(1).timeout
		reset()
	jookseb = true
		#Siia läheb mehe animatsioon.

func esita_valik():
	valikunumber += 1
	if valik1 != null:
		valik1.queue_free()
	if valik2 != null:
		valik2.queue_free()
	if valik3 != null:
		valik3.queue_free()
	if valikunumber == 14 or valikunumber == 19:
		nr = 0
	else:	
		eseme_asukohad.shuffle()
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
		
	
	if valikunumber == 17 or valikunumber == 19:
		valik1.õige = true
		valik2.õige = true
		valik3.õige = true
		if valikunumber == 19:
			valik1.scale*=2
			valik2.scale*=2
			valik3.scale*=2
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
		
@onready var talk_player = $audioplayers/talk
func lisa_tekst(küsimus):
	$Tekstimull.visible = true
	$Tekstimull.text = küsimus
	$Tekstimull.visible_characters = 0
	for i in range($Tekstimull.text.length()):
		$Tekstimull.visible_characters = i+1
		await get_tree().create_timer(teksti_kiirus).timeout
		if !talk_player.playing:
			talk_player.play()
		#print(talk_player.get_playback_position())
		if talk_player.get_playback_position() > 0.72:
			talk_player.play(0.04)
			

func kaotad():
	for i in range(eq.get_band_count()):
		eq.set_band_gain_db(i, originaleq[i])

	AudioManager.get_node("kaotus").play()
	kaotasid = true
	play_animation()





func _on_button_pressed() -> void:
	$audioplayers/togame.play()
	audioFX_change()
	MängiNupuVajutusel()


func _on_exit_button_pressed() -> void:
	get_tree().quit()
