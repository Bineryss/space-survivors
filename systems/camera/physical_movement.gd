extends RigidBody2D

@export var speed := 500
@export var direction := Vector2.RIGHT

func _input(event: InputEvent) -> void:
	if not event.is_action_pressed("primary_action"): return
	linear_velocity += direction * speed
