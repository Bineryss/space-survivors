extends Area2D
class_name  HurtBoxComponent

@export var health_component: HealthComponent

func damage(attack: int) -> void:
	if not health_component: return
	health_component.damage(attack)
