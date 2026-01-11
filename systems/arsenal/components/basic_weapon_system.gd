extends Node2D
class_name BasicWeaponSystem

@export var bullet_root: Node2D
@export var weapon_data: WeaponData

var is_shooting: bool = false

func init(bullet_rootP: Node2D, weapon_dataP: WeaponData) -> void:
	self.bullet_root = bullet_rootP
	self.weapon_data = weapon_dataP

func try_shoot() -> void:
	#TODO add target strategy
	if is_shooting: return
	is_shooting = true

	var target: Node2D = null

	var spawn_params: SpawnParams = SpawnParams.with_target(self, bullet_root, target)
	await weapon_data.spawn_strategy.execute(spawn_params, weapon_data) # await is correct here, problem with gdscript
	is_shooting = false
