extends SpawnStrategy
class_name SpawnSalvo

@export var pellets: int = 3
@export var delay: float = 0.08

func execute(spawn_params: SpawnParams, data: WeaponData) -> void:
	for i in pellets:
		_spawn_attack_actor(spawn_params, data)

		if i < pellets - 1:
			await spawn_params.projectile_parent.get_tree().create_timer(delay).timeout
