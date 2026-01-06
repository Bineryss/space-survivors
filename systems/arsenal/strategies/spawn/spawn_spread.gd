extends SpawnStrategy
class_name SpawnSpread

@export var pellet_count: int = 5
@export var arc_degrees: float = 18.0

func execute(ctx: FireContext, data: WeaponData) -> void:
	if pellet_count <= 0:
		return

	var half_arc := deg_to_rad(arc_degrees) * 0.5
	for i in pellet_count:
		var t := 0.0 if pellet_count == 1 else float(i) / float(pellet_count - 1)
		var angle: float = lerp(-half_arc, half_arc, t)
		
		_spawn_attack_actor(ctx, data, SpawnPositionOverride.with_rotation(ctx.muzzle_global.global_rotation + angle))
