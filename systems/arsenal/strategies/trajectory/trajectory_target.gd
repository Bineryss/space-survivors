extends TrajectoryStrategy
class_name TrajectoryHoming

func step(attack_actor: Node2D, delta: float, ctx: FireContext, data: WeaponData) -> void:
	var target = ctx.target
	if not target:
		return
	
	var direction = (target.global_position - attack_actor.global_position).normalized()
	attack_actor.position += direction * data.projectile_speed * delta
