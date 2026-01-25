extends Node
class_name ModificationMapper


static func get_target_strategy(modifications: Dictionary[ModifiableProperty.WeaponPropertyKey, ModificationData]) -> TargetStrategy:
	if not modifications.has(ModifiableProperty.WeaponPropertyKey.TARGET_STRATEGY):
		return null

	var modification: Modification = modifications[ModifiableProperty.WeaponPropertyKey.TARGET_STRATEGY].modifications[0]

	if not modification.replacement_strategy is TargetStrategy:
		return null
	
	return modification.replacement_strategy as TargetStrategy

static func get_spawn_strategy(modifications: Dictionary[ModifiableProperty.WeaponPropertyKey, ModificationData]) -> SpawnStrategy:
	if not modifications.has(ModifiableProperty.WeaponPropertyKey.SPAWN_STRATEGY):
		return null

	var modification: Modification = modifications[ModifiableProperty.WeaponPropertyKey.SPAWN_STRATEGY].modifications[0]
	if not modification.replacement_strategy is SpawnStrategy:
		return null
	
	return modification.replacement_strategy as SpawnStrategy

static func get_trajectory_strategy(modifications: Dictionary[ModifiableProperty.WeaponPropertyKey, ModificationData]) -> TrajectoryStrategy:
	var modification = modifications.get(ModifiableProperty.WeaponPropertyKey.TRAJECTORY_STRATEGY)
	if modification == null:
		return null

	var trajectory_modification: Modification = modification.modifications[0]
	if not trajectory_modification.replacement_strategy is TrajectoryStrategy:
		return null
	
	return trajectory_modification.replacement_strategy as TrajectoryStrategy

static func get_modified_value(target_prop: ModifiableProperty.WeaponPropertyKey, value: float, modifications: Dictionary[ModifiableProperty.WeaponPropertyKey, ModificationData]) -> float:
	var modification_data: ModificationData = modifications.get(target_prop, null)
	if modification_data == null: return value

	var total_value: float = (value + modification_data.cached_add_value) * modification_data.cached_multiply_value
	return total_value