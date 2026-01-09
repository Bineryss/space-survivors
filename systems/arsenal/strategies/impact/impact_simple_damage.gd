extends ImpactStrategy
class_name ImpactSimpleDamage

@export var damage_amount: float = 10.0

func on_impact(attack_actor: AttackActor, _ctx: FireContext, _data: WeaponData, body: Node2D) -> void:
	if body is HurtBoxComponent:
		body.damage(damage_amount)
	attack_actor.queue_free()
