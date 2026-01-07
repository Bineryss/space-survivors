extends TrajectoryStrategy
class_name TrajectoryStraight

func step(attack_actor: Node2D, delta: float, ctx: FireContext, data: WeaponData) -> void:
    attack_actor.position += attack_actor.transform.x * data.projectile_speed * delta