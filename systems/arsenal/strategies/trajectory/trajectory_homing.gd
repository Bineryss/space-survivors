extends TrajectoryStrategy
class_name TrajectoryHoming

@export var turn_rate: float = 5.0
@export var speed: float = 800.0

func step(attack_actor: Node2D, delta: float, ctx: FireContext, data: WeaponData) -> void:
	var target = ctx.target
	if not target:
		return
	
	var direction = (target.global_position - attack_actor.global_position).normalized()
	attack_actor.position += direction * speed * delta
	attack_actor.look_at(target.global_position)
