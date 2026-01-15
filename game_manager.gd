extends Node


var enemy_destroyed_count: int = 0
var pickups_collected: int = 0
var current_level: int = 0
var required_xp: int = 0

@onready var game_ui: GameUI = %GameUI

func _ready() -> void:
	SignalBus.player_died.connect(_on_player_died)
	SignalBus.pickup_collected.connect(_on_pickup_collected)
	SignalBus.enemy_destroyed.connect(_on_enemy_destroyed)
	SignalBus.player_hurt.connect(_on_player_hurt)
	reset_ui()

func _on_player_died() -> void:
	reset_ui()
	get_tree().reload_current_scene()

func _on_pickup_collected() -> void:
	print("Pickup collected!", pickups_collected, required_xp)
	pickups_collected += 1
	required_xp = calculate_required_xp(current_level + 1)
	game_ui.current_level_progress = float(pickups_collected) / required_xp

	if pickups_collected >= required_xp: 
		current_level += 1
		pickups_collected = 0

func _on_enemy_destroyed() -> void:
	enemy_destroyed_count += 1
	game_ui.kill_count = enemy_destroyed_count

func _on_player_hurt(current_health: float) -> void:
	game_ui.current_health = current_health / 10.0 # TODO: get health from data storage/service


func calculate_required_xp(next_level: int) -> int:
	# Vampire Survivors formula
	if next_level < 20:
		return (next_level * 10) - 5
	elif next_level < 40:
		return (next_level * 13) - 6
	else:
		return (next_level * 16) - 8


func reset_ui() -> void:
	enemy_destroyed_count = 0
	pickups_collected = 0
	current_level = 0
	required_xp = calculate_required_xp(current_level + 1)
	game_ui.kill_count = enemy_destroyed_count
	game_ui.current_health = 1.0
	game_ui.current_level_progress = 0.0