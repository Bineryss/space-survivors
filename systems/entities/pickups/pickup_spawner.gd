extends Node2D

@export var pickup_scene: PackedScene


func _ready() -> void:
	SignalBus.enemy_destroyed.connect(_on_enemy_destroyed)

func _on_enemy_destroyed(position: Vector2) -> void:
	var pickup_instance: Node2D = pickup_scene.instantiate()
	pickup_instance.global_position = position
	add_child(pickup_instance)