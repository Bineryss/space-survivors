extends Node2D

@export var speed := 1000
@export var direction := Vector2.RIGHT

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	
