extends SpawnStrategy
class_name SpawnSpread

@export var pellet_count: int = 5
@export var arc_degrees: float = 18.0

func execute(spawn_params: SpawnParams, data: WeaponData) -> void:
	if pellet_count <= 0:
		return

	var half_arc := deg_to_rad(arc_degrees) * 0.5
	for i in pellet_count:
		var t := 0.0 if pellet_count == 1 else float(i) / float(pellet_count - 1)
		var angle: float = lerp(-half_arc, half_arc, t)

		_spawn_attack_actor(spawn_params, data, SpawnPositionOverride.with_rotation(spawn_params.get_spawn_rotation() + angle))
