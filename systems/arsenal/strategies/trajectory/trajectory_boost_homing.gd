extends TrajectoryStrategy
class_name TrajectoryBoostHoming


@export var steer_force: float = 450.0
@export var max_speed: float = 400.0
@export var boost_duration: float = 0.3
@export var boost_multiplier: float = 4.0

var _homing_trajectory: TrajectoryHoming = TrajectoryHoming.new()

func step(attack_actor: Node2D, delta: float, ctx: FireContext, data: WeaponData) -> void:
	if not ctx.data.has("boost_timer"):
		ctx.data["boost_timer"] = boost_duration

	if ctx.data["boost_timer"] > 0:
		ctx.data["boost_timer"] -= delta
		attack_actor.position += attack_actor.transform.x * max_speed * boost_multiplier * delta
		return

	_homing_trajectory.steer_force = steer_force
	_homing_trajectory.max_speed = max_speed
	_homing_trajectory.step(attack_actor, delta, ctx, data)

