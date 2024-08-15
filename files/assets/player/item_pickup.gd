extends RayCast3D

var collider
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_colliding():
		collider = get_collider()
		if Input.is_action_just_pressed("pickup"):
			var pickup = collider.owner
			pickup.pickup()
	else:
		collider = 0
