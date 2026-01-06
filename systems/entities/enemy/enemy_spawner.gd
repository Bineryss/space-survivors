extends Node2D

@export var enemy_instance: PackedScene
@export var enemy_container: Node2D

@onready var pathFollow = %PathFollow2D

func spawn_enemy() -> void:
	var enemy: Enemy = enemy_instance.instantiate()
	pathFollow.progress_ratio = randf()
	enemy.global_position = pathFollow.global_position
	enemy_container.add_child(enemy)

func _on_timer_timeout() -> void:
	spawn_enemy()
