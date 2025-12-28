extends Sprite2D

func _process(delta: float) -> void:
	%Pointer.global_position = get_global_mouse_position()
