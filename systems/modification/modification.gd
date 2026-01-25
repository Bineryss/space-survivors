@tool
extends Resource
class_name Modification

static var expected_types = {
		ModifiableProperty.WeaponPropertyKey.TRAJECTORY_STRATEGY: TrajectoryStrategy,
		ModifiableProperty.WeaponPropertyKey.SPAWN_STRATEGY: SpawnStrategy,
		ModifiableProperty.WeaponPropertyKey.TARGET_STRATEGY: TargetStrategy,
		# TODO: Add other strategy types here as needed
	}
enum ModificationType {
	ADD,
	MULTIPLY,
	REPLACE
}

@export_group("Modification Info")
@export var name: String
@export var description: String


@export var modifications: Array[AtomicModification] = []

@export_group("Modification Effect")
@export var stat_operation: ModificationType
@export var target_prop: ModifiableProperty.WeaponPropertyKey
@export var stat_value: float
@export var replacement_strategy: Resource:
	set(value):
		if not _validate_strategy_type(value):
			push_error("Invalid strategy type assigned to modification for property %s" % str(target_prop))
			return
		replacement_strategy = value


func _validate_strategy_type(strategy: Resource) -> bool:
	if target_prop not in expected_types:
		return true
		
	var expected_type = expected_types[target_prop]
	return is_instance_of(strategy, expected_type)