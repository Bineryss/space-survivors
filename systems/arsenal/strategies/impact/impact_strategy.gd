@abstract
extends Resource
class_name ImpactStrategy

@abstract
func on_impact(attack_actor: AttackActor, ctx: FireContext, data: WeaponData, body: Node2D) -> void