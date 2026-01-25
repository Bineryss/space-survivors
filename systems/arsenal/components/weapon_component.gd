extends Node2D
class_name WeaponComponent

@export var projectile_root: Node2D
@export var weapon_config: WeaponConfig

var weapon_data: WeaponData
var is_shooting: bool = false
var target_strategy: TargetStrategy
var spawn_strategy: SpawnStrategy

func _ready() -> void:
	if weapon_config != null:
		weapon_data = weapon_config.get_data()

func init(projectile_rootP: Node2D, weapon_dataP: WeaponData) -> void:
	print("Initializing weapon component with new weapon data", ModificationMapper.get_spawn_strategy(weapon_dataP.active_modifications))
	self.projectile_root = projectile_rootP
	self.target_strategy = ModificationMapper.get_target_strategy(weapon_dataP.active_modifications)
	self.spawn_strategy = ModificationMapper.get_spawn_strategy(weapon_dataP.active_modifications)
	self.weapon_data = weapon_dataP

func try_shoot() -> void:
	if is_shooting: return
	is_shooting = true

	if spawn_strategy == null:
		is_shooting = false
		print("No spawn strategy assigned to weapon data")
		return

	var target: Node2D = null
	if target_strategy != null:
		print("Using target strategy to get target")
		target = target_strategy.get_target(self)
		print("Acquired target: %s" % str(target))
	
	var spawn_params: SpawnParams = SpawnParams.with_target(self, projectile_root, target)
	await spawn_strategy.execute(spawn_params, weapon_data) # await is correct here, problem with gdscript
	is_shooting = false
