extends Node2D
class_name AttackActor

@export var collision_grace_period: float = 0.1 # Seconds before collision is active
var collision_timer: float = 0.0
var collision_enabled: bool = false

var trajectory: TrajectoryStrategy
var impact: ImpactStrategy
var despawnS: DespawnStrategy
var ctx: FireContext
var data: WeaponData

func init_from(fire_ctx: FireContext, weapon_data: WeaponData) -> void:
	ctx = fire_ctx
	impact = weapon_data.impact_strategy
	trajectory = weapon_data.trajectory_strategy
	despawnS = weapon_data.despawn_strategy
	data = weapon_data
	collision_enabled = false
	collision_timer = collision_grace_period

func _physics_process(delta: float) -> void:
	if not collision_enabled:
		collision_timer -= delta
		if collision_timer <= 0:
			collision_enabled = true
	if trajectory:
		trajectory.step(self, delta, ctx, data)
	if despawnS and despawnS.should_despawn(self, delta, ctx):
		despawn()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if not collision_enabled: return
	impact.on_impact(self, ctx, data, area)
	despawn()


func despawn() -> void:
	queue_free()
	# here we could also play some despawn effects if needed
