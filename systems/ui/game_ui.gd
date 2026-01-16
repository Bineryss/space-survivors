extends Control
class_name GameUI

signal upgrade_selected(selection: int)

@onready var upgrade_1: Button = %Upgrade1
@onready var upgrade_2: Button = %Upgrade2
@onready var upgrade_3: Button = %Upgrade3
@onready var upgrade_screen: Control = %UpgradeScreen

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
	upgrade_1.pressed.connect(func() -> void:
		handle_upgrade_selection(0)
	)
	upgrade_2.pressed.connect(func() -> void:
		handle_upgrade_selection(1)
	)
	upgrade_3.pressed.connect(func() -> void:
		handle_upgrade_selection(2)
	)
	upgrade_screen.visible = false

func show_upgrade_screen() -> void:
	upgrade_screen.visible = true

func handle_upgrade_selection(upgrade_index: int) -> void:
	upgrade_selected.emit(upgrade_index)
	upgrade_screen.visible = false