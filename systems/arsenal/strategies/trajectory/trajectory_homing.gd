extends TrajectoryStrategy
class_name TrajectoryHoming

@export var steer_force: float = 450.0
@export var max_speed: float = 400.0

func step(attack_actor: Node2D, delta: float, ctx: FireContext, data: WeaponData) -> void:
	var target = ctx.target
	if not is_instance_valid(target):
		return
	
	if not ctx.data.has("velocity"):
		ctx.data["velocity"] = attack_actor.transform.x * max_speed
		ctx.data["acceleration"] = Vector2.ZERO
	
	var velocity: Vector2 = ctx.data["velocity"]
	var acceleration: Vector2 = ctx.data["acceleration"]
	
	var desired_velocity = (target.global_position - attack_actor.global_position).normalized() * max_speed
	var steer = (desired_velocity - velocity).normalized() * steer_force
	
	acceleration += steer
	velocity += acceleration * delta
	velocity = velocity.limit_length(max_speed)
	
	attack_actor.global_position += velocity * delta
	attack_actor.rotation = velocity.angle()
	
	ctx.data["velocity"] = velocity
	ctx.data["acceleration"] = Vector2.ZERO
