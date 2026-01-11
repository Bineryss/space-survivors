class_name Enemy extends CharacterBody2D

@export var state_machine: StateMachine
@export var enemy_data: EnemyData

@onready var health_component: HealthComponent = %HealthComponent
@onready var weapon_component: WeaponComponent = %WeaponComponent
@onready var sprite: Sprite2D = %Sprite2D

var projectile_root: Node2D

func init(data: EnemyData, projectile_rootP: Node2D) -> void:
	enemy_data = data
	projectile_root = projectile_rootP

func _ready() -> void:
	state_machine.init(self)
	health_component.init(enemy_data.base_health)
	weapon_component.init(projectile_root, enemy_data.weapon_data)
	sprite.frame = enemy_data.enemy_sprite
	sprite.modulate = enemy_data.enemy_color

func _physics_process(_delta: float) -> void:
	move_and_slide()

func _on_vision_area_body_entered(body: Node2D) -> void:
	if body is PlayerControler: state_machine.context.target = body


func _on_vision_area_body_exited(body: Node2D) -> void:
	if body is PlayerControler: state_machine.context.target = null


func _on_shooting_range_body_entered(body: Node2D) -> void:
	if body is PlayerControler: state_machine.context.in_range = true


func _on_shooting_range_body_exited(body: Node2D) -> void:
	if body is PlayerControler: state_machine.context.in_range = false


func _on_health_component_health_depleated() -> void:
	SignalBus.enemy_destroyed.emit()
	queue_free()

func _on_enemy_circle_fire_signal() -> void:
	weapon_component.try_shoot()
