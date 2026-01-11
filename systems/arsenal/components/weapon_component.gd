extends Node2D
class_name WeaponComponent

@export var projectile_root: Node2D
@export var weapon_data: WeaponData

var is_shooting: bool = false

func init(projectile_rootP: Node2D, weapon_dataP: WeaponData) -> void:
	self.projectile_root = projectile_rootP
	self.weapon_data = weapon_dataP

func try_shoot() -> void:
	if is_shooting: return
	is_shooting = true

	if weapon_data.spawn_strategy == null:
		is_shooting = false
		return

	var target: Node2D = null
	if weapon_data.target_strategy != null:
		target = weapon_data.target_strategy.get_target(self)
	
	var spawn_params: SpawnParams = SpawnParams.with_target(self, projectile_root, target)
	await weapon_data.spawn_strategy.execute(spawn_params, weapon_data) # await is correct here, problem with gdscript
	is_shooting = false
