extends SpawnStrategy

class_name SpawnSalvoSpread

@export var pellets: int = 3
@export var delay: float = 0.08
@export var spread: SpawnSpread

func execute(ctx: FireContext, data: WeaponData) -> void:
	for i in pellets:
		spread.execute(ctx, data)

		if i < pellets - 1:
			await ctx.projectile_parent.get_tree().create_timer(delay).timeout
