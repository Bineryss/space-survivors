extends SpawnStrategy

class_name SpawnSalvoSpread

@export var pellets: int = 3
@export var delay: float = 0.08
@export var spread: SpawnSpread

func execute(spawn_params: SpawnParams, data: WeaponData) -> void:
	for i in pellets:
		spread.execute(spawn_params, data)

		if i < pellets - 1:
			await spawn_params.projectile_parent.get_tree().create_timer(delay).timeout
