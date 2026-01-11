extends Node2D
class_name  HealthComponent

signal health_depleated

@export var max_health := 10
@export var display_timer := 0

@onready var health_bar = %HealthBar
@onready var timer = %Timer # invincibility timer?

var health: float

func init(max_health_value: int) -> void:
	max_health = max_health_value
	_ready()

func _ready() -> void:
	health = max_health
	health_bar.max_value = max_health
	health_bar.value = health
	if display_timer > 0:
		timer.wait_time = display_timer
	
func damage(attack: int) -> void:
	health -= attack
	health_bar.value = health
	show_health_bar()
	if display_timer > 0:
		timer.start()
	if health <= 0:
		health_depleated.emit()

func show_health_bar() -> void:
	health_bar.show()
	
func hide_health_bar() -> void:
	health_bar.hide()

func _on_timer_timeout() -> void:
	health_bar.hide()
