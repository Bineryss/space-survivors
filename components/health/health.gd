extends Node2D
class_name  HealthComponent

signal health_depleated

@export var max_health := 10

@onready var healthBar = %HealthBar

var health: float

func _ready() -> void:
	health = max_health
	healthBar.max_value = max_health
	healthBar.value = health
	
func damage(attack: int) -> void:
	health -= attack
	healthBar.value = health
	if health <= 0:
		health_depleated.emit()
