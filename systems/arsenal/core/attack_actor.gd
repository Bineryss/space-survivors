extends Node2D
class_name AttackActor

var trajectory: TrajectoryStrategy
var ctx: FireContext
var data: WeaponData

func init_from(fire_ctx: FireContext, weapon_data: WeaponData) -> void:
	ctx = fire_ctx
	trajectory = weapon_data.trajectory_strategy
	data = weapon_data
	# if trajectory:
	# 	trajectory.on_spawn(self, ctx)

func _physics_process(delta: float) -> void:
	if trajectory:
		trajectory.step(self, delta, ctx, data)
