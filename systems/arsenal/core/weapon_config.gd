extends Resource
class_name WeaponConfig

@export var attack_actor_scene: PackedScene
@export var projectile_color: ProjectileColor = null
@export_flags_2d_physics var collision_masks: int = 0

@export_category("Strategies")
@export var target_strategy: TargetStrategy = null
@export var spawn_strategy: SpawnStrategy = null
@export var trajectory_strategy: TrajectoryStrategy = null
@export var impact_strategy: ImpactStrategy = null
@export var despawn_strategy: DespawnStrategy = null

func get_data() -> WeaponData:
	var data := WeaponData.new()
	data.attack_actor_scene = attack_actor_scene
	data.projectile_color = projectile_color
	data.collision_masks = collision_masks
	data.target_strategy = target_strategy
	data.spawn_strategy = spawn_strategy
	data.trajectory_strategy = trajectory_strategy
	data.impact_strategy = impact_strategy
	data.despawn_strategy = despawn_strategy
	data.active_modifications = _to_modifications()
	return data


func _to_modifications() -> Dictionary[ModifiableProperty.WeaponPropertyKey, ModificationData]:
	var modifications: Dictionary[ModifiableProperty.WeaponPropertyKey, ModificationData] = {}
	if target_strategy:
		var targetModification: Modification = Modification.new()
		targetModification.stat_operation = Modification.ModificationType.REPLACE
		targetModification.target_prop = ModifiableProperty.WeaponPropertyKey.TARGET_STRATEGY
		targetModification.replacement_strategy = target_strategy
		modifications[ModifiableProperty.WeaponPropertyKey.TARGET_STRATEGY] = ModificationData.with_modification(targetModification, ModifiableProperty.WeaponPropertyKey.TARGET_STRATEGY)
	if spawn_strategy:
		var spawn_strategy_modification: Modification = Modification.new()
		spawn_strategy_modification.stat_operation = Modification.ModificationType.REPLACE
		spawn_strategy_modification.target_prop = ModifiableProperty.WeaponPropertyKey.SPAWN_STRATEGY
		spawn_strategy_modification.replacement_strategy = spawn_strategy
		modifications[ModifiableProperty.WeaponPropertyKey.SPAWN_STRATEGY] = ModificationData.with_modification(spawn_strategy_modification, ModifiableProperty.WeaponPropertyKey.SPAWN_STRATEGY)
	if trajectory_strategy:
		var trajectory_strategy_modification: Modification = Modification.new()
		trajectory_strategy_modification.stat_operation = Modification.ModificationType.REPLACE
		trajectory_strategy_modification.target_prop = ModifiableProperty.WeaponPropertyKey.TRAJECTORY_STRATEGY
		trajectory_strategy_modification.replacement_strategy = trajectory_strategy
		modifications[ModifiableProperty.WeaponPropertyKey.TRAJECTORY_STRATEGY] = ModificationData.with_modification(trajectory_strategy_modification, ModifiableProperty.WeaponPropertyKey.TRAJECTORY_STRATEGY)
	if impact_strategy:
		var impact_strategy_modification: Modification = Modification.new()
		impact_strategy_modification.stat_operation = Modification.ModificationType.REPLACE
		impact_strategy_modification.target_prop = ModifiableProperty.WeaponPropertyKey.IMPACT_STRATEGY
		impact_strategy_modification.replacement_strategy = impact_strategy
		modifications[ModifiableProperty.WeaponPropertyKey.IMPACT_STRATEGY] = ModificationData.with_modification(impact_strategy_modification, ModifiableProperty.WeaponPropertyKey.IMPACT_STRATEGY)
	if despawn_strategy:
		var despawn_strategy_modification: Modification = Modification.new()
		despawn_strategy_modification.stat_operation = Modification.ModificationType.REPLACE
		despawn_strategy_modification.target_prop = ModifiableProperty.WeaponPropertyKey.DESPAWN_STRATEGY
		despawn_strategy_modification.replacement_strategy = despawn_strategy
		modifications[ModifiableProperty.WeaponPropertyKey.DESPAWN_STRATEGY] = ModificationData.with_modification(despawn_strategy_modification, ModifiableProperty.WeaponPropertyKey.DESPAWN_STRATEGY)
	return modifications
