extends ImpactStrategy
class_name ImpactSimpleDamage

@export var damage_amount: float = 10.0

func on_impact(_attack_actor: AttackActor, _ctx: FireContext, _data: WeaponData, body: Node2D) -> bool:
	if body is HurtBoxComponent:
		body.damage(damage_amount)
	return true
