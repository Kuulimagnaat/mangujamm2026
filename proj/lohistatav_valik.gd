extends Node2D

var lohistab = false
var hiir_valikul = false
var og_pos
var vanem
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	vanem = get_parent()
	z_index = 10
	$Area2D.mouse_entered.connect(hiirekontroll)
	$Area2D.mouse_exited.connect(hiirekontroll)
	scale*=0.9
func hiirekontroll():
	if hiir_valikul == true and not Input.is_action_pressed("Vasak_Hiir"):
		hiir_valikul = false
	elif hiir_valikul == false:
		hiir_valikul = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if lohistab == true:
		self.global_position = get_global_mouse_position()
	if hiir_valikul == true and Input.is_action_pressed("Vasak_Hiir"):
		lohistab = true
	else:
		if hiir_valikul == true and vanem.hiir_masinal == true:
			masinasse()
		else:
			lohistab = false

	if Input.is_action_just_released("Vasak_Hiir") and hiir_valikul == true:
		var tween = get_tree().create_tween()
		tween.tween_property($".", "position", Vector2(og_pos), 0.4)
		
func masinasse():
	queue_free()
