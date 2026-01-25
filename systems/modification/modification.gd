extends Resource
class_name Modification

enum ModificationType {
	ADD,
	MULTIPLY,
	REPLACE
}

@export_group("Modification Info")
@export var name: String
@export var description: String

@export_group("Modification Effect")
@export var stat_operation: ModificationType
@export var target_prop: ModifiableProperty.WeaponPropertyKey
@export var stat_value: float
@export var replacement_strategy: Resource