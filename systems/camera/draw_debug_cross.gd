extends Node2D

@export var length := Vector2(3000,2000)
@export var center_radius := 50

func _draw() -> void:
	draw_dashed_line(Vector2(length.x / 2, 0), Vector2(center_radius, 0), Color.WHITE, 5, 30)
	draw_dashed_line(Vector2(-(length.x / 2), 0), Vector2(-center_radius, 0), Color.WHITE, 5,30)
	draw_dashed_line(Vector2(0, length.y / 2), Vector2(0, center_radius), Color.WHITE, 5, 30)
	draw_dashed_line(Vector2(0, -(length.y / 2)), Vector2(0, -center_radius), Color.WHITE, 5,30)
