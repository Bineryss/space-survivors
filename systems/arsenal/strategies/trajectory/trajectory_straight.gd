extends TrajectoryStrategy
class_name TrajectoryStraight

@export var speed: int = 1200

func step(attack_actor: Node2D, delta: float, _ctx: FireContext, _data: WeaponData) -> void:
    attack_actor.position += attack_actor.transform.x * speed * delta