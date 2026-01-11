extends StaticBody2D

signal astroid_destroyed

@onready var desctruction_particels := %DestructionParticles
@onready var hurt_box: HurtBoxComponent = %HurtBox
@onready var sprite := $Sprite2D
@onready var health := $HealthComponent

func _ready() -> void:
	health.hide_health_bar()

func _on_health_component_health_depleated() -> void:
	sprite.hide()
	health.hide()
	collision_layer = 32 # disable collisions
	hurt_box.collision_layer = 32 # disable collisions
	astroid_destroyed.emit()
	desctruction_particels.one_shot = true
	desctruction_particels.restart()
	await desctruction_particels.finished
	queue_free()
