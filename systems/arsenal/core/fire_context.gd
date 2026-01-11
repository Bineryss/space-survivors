extends RefCounted
class_name FireContext

#var shooter: Node2D
var muzzle_global: Node2D
var attack_actor: Node2D
#var aim_dir: Vector2
var projectile_parent: Node # container of all spawned projectiles
var target: Node2D
var data: Dictionary[String, Variant] = {}
#var weapon: WeaponData

static func from_spawn_params(spawn_params: SpawnParams) -> FireContext:
	var ctx: FireContext = FireContext.new()
	ctx.muzzle_global = spawn_params.muzzle_global
	ctx.projectile_parent = spawn_params.projectile_parent
	ctx.target = spawn_params.target
	return ctx