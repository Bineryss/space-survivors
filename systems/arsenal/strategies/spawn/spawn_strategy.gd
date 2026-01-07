@abstract
class_name SpawnStrategy extends Resource

@abstract
func execute(ctx: FireContext, data: WeaponData) -> void

func _spawn_attack_actor(ctx: FireContext, data: WeaponData, spawn_position_overwrite: SpawnPositionOverride = null) -> void:
		var attack_actor: AttackActor = data.attack_actor_scene.instantiate()
		
		var position: Vector2 = ctx.muzzle_global.global_position
		var rotation: float = ctx.muzzle_global.global_rotation
		if spawn_position_overwrite != null:
			if spawn_position_overwrite.has_position:
				position = spawn_position_overwrite.position
			if spawn_position_overwrite.has_rotation:
				rotation = spawn_position_overwrite.rotation
		
		attack_actor.global_position = position
		attack_actor.global_rotation = rotation
		attack_actor.init_from(ctx, data)
		ctx.projectile_parent.add_child(attack_actor)
