extends ImpactStrategy
class_name ImpactSubInstances

@export var sub_pellet: WeaponData
@export var damage_amount: float = 10.0


func on_impact(_attack_actor: AttackActor, ctx: FireContext, _data: WeaponData, body: Node2D) -> void:
	if body is HurtBoxComponent:
		body.damage(damage_amount)
	
	var new_ctx: FireContext = FireContext.new()
	new_ctx.muzzle_global = body
	new_ctx.muzzle_global.rotation = _attack_actor.rotation
	new_ctx.projectile_parent = ctx.projectile_parent
	new_ctx.target = ctx.target
	await sub_pellet.spawn_strategy.execute(new_ctx, sub_pellet) # await is correct here, problem with gdscript

# TODO why do subpellets despawn this quick?
