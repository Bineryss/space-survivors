extends ImpactStrategy
class_name ImpactPricingDamage

const PIERCE_COUNT = "pierce_count"

@export var damage_amount: float = 10.0
@export var pierce_count: int = 3

func on_impact(_attack_actor: AttackActor, ctx: FireContext, _data: WeaponData, body: Node2D) -> bool:
	if body is HurtBoxComponent:
		body.damage(damage_amount)

	var current_pierce: int = 1
	if ctx.data.has(PIERCE_COUNT):
		current_pierce = ctx.data[PIERCE_COUNT]

	if current_pierce >= pierce_count:
		return true

	ctx.data[PIERCE_COUNT] = current_pierce + 1
	return false