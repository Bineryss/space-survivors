extends StaticBody2D

signal astroid_destroyed

@onready var desctruction_particels := %DestructionParticles
@onready var sprite := $Sprite2D
@onready var health := $HealthComponent

func _on_health_component_health_depleated() -> void:
	set_physics_process(false)
	sprite.hide()
	health.hide()
	astroid_destroyed.emit()
	desctruction_particels.one_shot = true
	desctruction_particels.restart()
	await desctruction_particels.finished
	queue_free()
	
