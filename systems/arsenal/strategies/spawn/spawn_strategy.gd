@abstract
class_name SpawnStrategy extends Resource

@abstract
func execute(spawn_params: SpawnParams, data: WeaponData) -> void

func _spawn_attack_actor(spawn_params: SpawnParams, data: WeaponData, spawn_position_overwrite: SpawnPositionOverride = null) -> void:
		var attack_actor: AttackActor = data.attack_actor_scene.instantiate()
		
		var position: Vector2 = spawn_params.get_spawn_position()
		var rotation: float = spawn_params.get_spawn_rotation()
		if spawn_position_overwrite != null:
			if spawn_position_overwrite.has_position:
				position = spawn_position_overwrite.position
			if spawn_position_overwrite.has_rotation:
				rotation = spawn_position_overwrite.rotation
		
		attack_actor.global_position = position
		attack_actor.global_rotation = rotation
		var context: FireContext = FireContext.from_spawn_params(spawn_params)
		attack_actor.init_from(context, data)
		spawn_params.projectile_parent.add_child(attack_actor)
