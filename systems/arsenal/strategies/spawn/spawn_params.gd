extends RefCounted
class_name SpawnParams

var muzzle_global: Node2D
var projectile_parent: Node
var target: Node2D = null

var position_override: SpawnPositionOverride = null

func get_spawn_position() -> Vector2:
	if position_override != null and position_override.has_position:
		return position_override.position
	return muzzle_global.global_position


func get_spawn_rotation() -> float:
	if position_override != null and position_override.has_rotation:
		return position_override.rotation
	return muzzle_global.global_rotation


static func without_target(muzzle_globalP: Node2D, projectile_parentP: Node) -> SpawnParams:
	var params: SpawnParams = SpawnParams.new()
	params.muzzle_global = muzzle_globalP
	params.projectile_parent = projectile_parentP
	return params

static func with_target(muzzle_globalP: Node2D, projectile_parentP: Node, targetP: Node2D) -> SpawnParams:
	var params: SpawnParams = SpawnParams.new()
	params.muzzle_global = muzzle_globalP
	params.projectile_parent = projectile_parentP
	params.target = targetP
	return params

static func from_fire_context(ctx: FireContext) -> SpawnParams:
	var params: SpawnParams = SpawnParams.new()
	params.muzzle_global = ctx.muzzle_global
	params.projectile_parent = ctx.projectile_parent
	params.target = ctx.target
	return params

func with_rotation_override(rot: float) -> SpawnParams:
	if position_override == null:
		position_override = SpawnPositionOverride.new()
	position_override.rotation = rot
	position_override.has_rotation = true
	return self


func with_position_override(pos: Vector2) -> SpawnParams:
	if position_override == null:
		position_override = SpawnPositionOverride.new()
	position_override.position = pos
	position_override.has_position = true
	return self
