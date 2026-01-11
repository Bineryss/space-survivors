extends Node2D
class_name AttackActor

@export var collision_grace_period: float = 0.1

@onready var sprite: Sprite2D = %ProjectileSprite
@onready var area_2d: Area2D = %Area2D


var collision_timer: float = 0.0
var collision_enabled: bool = false

var _trajectory: TrajectoryStrategy
var _impact: ImpactStrategy
var _despawnS: DespawnStrategy
var _ctx: FireContext
var _data: WeaponData

func _ready() -> void:
	if _data.projectile_color:
		sprite.modulate = _data.projectile_color.color
	if _data.collision_masks != 0:
		area_2d.collision_mask = _data.collision_masks

func init_from(fire_ctx: FireContext, weapon_data: WeaponData) -> void:
	_ctx = fire_ctx
	_impact = weapon_data.impact_strategy
	_trajectory = weapon_data.trajectory_strategy
	_despawnS = weapon_data.despawn_strategy
	_data = weapon_data
	collision_enabled = false
	collision_timer = collision_grace_period

func _physics_process(delta: float) -> void:
	if not collision_enabled:
		collision_timer -= delta
		if collision_timer <= 0:
			collision_enabled = true
	if _trajectory:
		_trajectory.step(self, delta, _ctx, _data)
	if _despawnS and _despawnS.should_despawn(self, delta, _ctx):
		despawn()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if not collision_enabled: return
	_impact.on_impact(self, _ctx, _data, area)
	despawn(true)


func despawn(_with_impact: bool = false) -> void:
	queue_free()
	#TODO add some despawn effects if
