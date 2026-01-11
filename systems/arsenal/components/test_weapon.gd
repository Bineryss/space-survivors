extends Node2D

@export var bullet_root: Node2D
@export var weapon_data: WeaponData
@export var target: Node2D
@export var weapon_system: WeaponComponent = null

var is_shooting: bool = false

func _ready() -> void:
	if weapon_system == null: return
	weapon_system.init(bullet_root, weapon_data)


func _input(event: InputEvent) -> void:
	if not event.is_action_pressed("primary_action"): return
	weapon_system.try_shoot()
