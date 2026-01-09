extends TrajectoryStrategy
class_name TrajectoryStraight

@export var speed: int = 1200

func step(attack_actor: Node2D, delta: float, ctx: FireContext, data: WeaponData) -> void:
    attack_actor.position += attack_actor.transform.x * speed * delta