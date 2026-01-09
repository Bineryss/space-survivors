extends Node2D
class_name AttackActor

var trajectory: TrajectoryStrategy
var impact: ImpactStrategy
var despawn: DespawnStrategy
var ctx: FireContext
var data: WeaponData

func init_from(fire_ctx: FireContext, weapon_data: WeaponData) -> void:
	ctx = fire_ctx
	impact = weapon_data.impact_strategy
	trajectory = weapon_data.trajectory_strategy
	despawn = weapon_data.despawn_strategy
	data = weapon_data
	# if trajectory:
	# 	trajectory.on_spawn(self, ctx)

func _physics_process(delta: float) -> void:
	if trajectory:
		trajectory.step(self, delta, ctx, data)
	if despawn and despawn.should_despawn(self, delta, ctx):
		queue_free()
		# here we could also trigger some despawn effect

func _on_area_2d_area_entered(area: Area2D) -> void:
	impact.on_impact(self, ctx, data, area)
