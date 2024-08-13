extends CSGBox3D

var light_flicker_ammount = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	light_flicker_ammount = randi_range(0,100)
	#if light_flicker_ammount < 50:
		
