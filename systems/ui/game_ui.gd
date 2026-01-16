extends Control
class_name GameUI

signal upgrade_selected(id: String)
signal restart_game_requested

@onready var upgrade_container: Control = %UpgradeScreen
@onready var upgrade_menu: UpgradeMenu = %UpgradeMenu
@onready var gameover_menu: GameOverScreen = %GameOverScreen

@onready var level_progress: ProgressBar = %LevelProgress
@onready var health: ProgressBar = %Health
@onready var kill_counter: Label = %KillCount

@export var kill_count: int = 0:
	set(value):
		if not is_instance_valid(kill_counter): return
		kill_counter.text = "Kills: %d" % value
		kill_count = value

@export var current_health: float = 0.5:
	set(value):
		if not is_instance_valid(health): return
		health.value = value * health.max_value
		current_health = value

@export var current_level_progress: float = 0.5:
	set(value):
		if not is_instance_valid(level_progress): return
		level_progress.value = value * level_progress.max_value
		current_level_progress = value

func _ready() -> void:
	kill_counter.text = "Kills: %d" % kill_count
	health.value = current_health * health.max_value
	level_progress.value = current_level_progress * level_progress.max_value
	upgrade_container.visible = false
	upgrade_menu.upgrade_selected.connect(handle_upgrade_selection)
	gameover_menu.restart_game_requested.connect(restart_game_requested.emit)

func show_game_over_screen() -> void:
	gameover_menu.visible = true
	upgrade_container.visible = false

func show_upgrade_screen() -> void:
	upgrade_container.visible = true

func handle_upgrade_selection(upgrade_id: String) -> void:
	upgrade_selected.emit(upgrade_id)
	upgrade_container.visible = false
