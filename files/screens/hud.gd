extends Control

@export var cursor_bottom : ColorRect
@export var cursor_top : ColorRect
@export var cursor_left : ColorRect
@export var cursor_right : ColorRect
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GlobalVars.select:
		cursor_bottom.position.y = lerp(cursor_bottom.position.y, cursor_bottom.position.y + 5, delta * 2)
		cursor_top.position.y = lerp(cursor_top.position.y, cursor_top.position.y - 5, delta * 2)
		cursor_right.position.y = lerp(cursor_right.position.y, cursor_right.position.y + 5, delta * 2)
		cursor_left.position.y = lerp(cursor_left.position.y, cursor_left.position.y - 5, delta * 2)
	else:
		cursor_bottom.position.y = lerp(cursor_bottom.position.y, cursor_bottom.position.y + 5, delta * 2)
		cursor_top.position.y = lerp(cursor_top.position.y, cursor_top.position.y - 5, delta * 2)
		cursor_right.position.y = lerp(cursor_right.position.y, cursor_right.position.y + 5, delta * 2)
		cursor_left.position.y = lerp(cursor_left.position.y, cursor_left.position.y - 5, delta * 2)
