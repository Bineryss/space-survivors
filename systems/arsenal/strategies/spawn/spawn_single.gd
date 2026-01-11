extends SpawnStrategy
class_name SpawnSingle

func execute(spawn_params: SpawnParams, data: WeaponData) -> void:
	_spawn_attack_actor(spawn_params, data)