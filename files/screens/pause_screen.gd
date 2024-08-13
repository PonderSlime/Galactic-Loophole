extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var pause_game : bool = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_is_paused()
	if get_tree().paused:
		visible = true
	else:
		visible = false
		
func _is_paused():
	if Input.is_action_just_pressed("pause"):
		pause_game = !pause_game
		get_tree().paused = !get_tree().paused
	if pause_game == false:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif pause_game == true:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
