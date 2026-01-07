@abstract
extends Resource
class_name TrajectoryStrategy

@abstract
func step(attack_actor: Node2D, delta: float, ctx: FireContext, data: WeaponData) -> void
