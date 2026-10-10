extends Node2D

var lohistab = false
var hiir_valikul
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Area2D.mouse_entered.connect(hiirekontroll)

func hiirekontroll():
	if hiir_valikul == true:
		hiir_valikul = false
	elif hiir_valikul == false:
		hiir_valikul = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Vasak_Hiir") and hiir_valikul == true:
		lohistab = true
	else:
		lohistab = false
