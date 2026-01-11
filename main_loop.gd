extends Node

var enemies_destroyed: int = 0

func _ready() -> void:
	SignalBus.player_died.connect(_on_player_death)
	SignalBus.enemy_destroyed.connect(_on_enemy_destroyed)

func _on_player_death() -> void:
	print("Player has died. Game Over.")

func _on_enemy_destroyed() -> void:
	enemies_destroyed += 1
	print("Enemies destroyed: %d" % enemies_destroyed)
