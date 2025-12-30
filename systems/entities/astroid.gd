extends StaticBody2D

signal astroid_destroyed

@onready var desctruction_particels := %DestructionParticles
@onready var sprite := $Sprite2D
@onready var health := $HealthComponent
@onready var hit_box := $HitBox
@onready var hurt_box := $HurtBox/CollisionShape2D

func _ready() -> void:
	health.hide_health_bar()

func _on_health_component_health_depleated() -> void:
	set_physics_process(false)
	sprite.hide()
	health.hide()
	hit_box.disabled = true
	hurt_box.disabled = true
	astroid_destroyed.emit()
	desctruction_particels.one_shot = true
	desctruction_particels.restart()
	await desctruction_particels.finished
	queue_free()
