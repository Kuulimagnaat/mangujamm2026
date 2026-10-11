extends VSlider

@onready var Master_ID = AudioServer.get_bus_index("Master")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	

func _value_changed(new_value: float) -> void:
	$"../Püks".region_rect.size.y = 437-2*new_value
	AudioServer.set_bus_volume_db(Master_ID, linear_to_db(1-(new_value/max_value)))
