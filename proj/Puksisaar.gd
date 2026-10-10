extends Area2D

var HiirNupuKohal
var lohitsamine

func HiirNupuKohale():
	HiirNupuKohal = true
func HiirNupuKohaltÄra():
	HiirNupuKohal = false
	

func _ready() -> void:
	mouse_entered.connect(HiirNupuKohale)
	mouse_exited.connect(HiirNupuKohaltÄra)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("Vasak_Hiir") and HiirNupuKohal):
		lohitsamine = true
	if (lohitsamine==true):
		position.x = 
