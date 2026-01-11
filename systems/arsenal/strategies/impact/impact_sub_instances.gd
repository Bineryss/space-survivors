extends ImpactStrategy
class_name ImpactSubInstances

@export var sub_pellet: WeaponData
@export var damage_amount: float = 10.0


func on_impact(attack_actor: AttackActor, ctx: FireContext, _data: WeaponData, body: Node2D) -> void:
	if body is HurtBoxComponent:
		body.damage(damage_amount)
	
	var spawn_params: SpawnParams = SpawnParams.from_fire_context(ctx).with_rotation_override(attack_actor.rotation)
	spawn_params.muzzle_global = body
	await sub_pellet.spawn_strategy.execute(spawn_params, sub_pellet) # await is correct here, problem with gdscript
