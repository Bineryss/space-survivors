extends SpawnStrategy
class_name SpawnSingle

func execute(ctx: FireContext, data: WeaponData) -> void:
	_spawn_attack_actor(ctx, data)
