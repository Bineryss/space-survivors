extends ImpactStrategy
class_name ImpactSimpleDamage

@export var damage_amount: float = 10.0

func on_impact(_attack_actor: AttackActor, _ctx: FireContext, data: WeaponData, body: Node2D) -> bool:
	if body is HurtBoxComponent:
		body.damage(ModificationMapper.get_modified_value(ModifiableProperty.WeaponPropertyKey.IMPACT_DAMAGE, damage_amount, data.active_modifications))
	return true
