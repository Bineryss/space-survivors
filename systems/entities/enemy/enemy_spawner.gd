extends Node2D

@export var enemy_instance: PackedScene
@export var spawn_interval: float = 2.0
@export var enemy_data: Array[EnemyData] = []
@export var enemy_container: Node2D
@export var projectile_root: Node2D

@onready var pathFollow = %PathFollow2D

func spawn_enemy() -> void:
	var enemy: Enemy = enemy_instance.instantiate()
	pathFollow.progress_ratio = randf()
	enemy.global_position = pathFollow.global_position
	enemy.init(enemy_data[randi_range(0, enemy_data.size()-1)], projectile_root)
	enemy_container.add_child(enemy)

func _on_timer_timeout() -> void:
	spawn_enemy()
