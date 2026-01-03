extends Node2D

@export var debug := false

func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()

func _draw() -> void:
	if !debug : return
	draw_circle(Vector2.ZERO, 10, Color.ROYAL_BLUE, false)
