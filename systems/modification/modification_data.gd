extends RefCounted
class_name ModificationData

var modifications: Array[Modification] = []:
	get:
		return modifications
var target_property: ModifiableProperty.WeaponPropertyKey:
	get:
		return target_property

var cached_add_value: float = 0.0
var cached_multiply_value: float = 1.0



static func with_modification(modificationP: Modification, propertyP: ModifiableProperty.WeaponPropertyKey) -> ModificationData:
	var modification_data: ModificationData = ModificationData.new()
	modification_data.modifications = [modificationP]
	modification_data.target_property = propertyP
	modification_data.recalculate_cached_values()
	return modification_data

# TODO: add method to add modification to correct dictioary key automatically
# static func add_modification_data() -> Dictionary[ModifiableProperty.WeaponPropertyKey, ModificationData]:
# 	return {}

func add_modification(modificationP: Modification) -> void:
	if modificationP.target_prop != target_property:
		print("Target prop mismatch!")
		return

	if modificationP.stat_operation == Modification.ModificationType.REPLACE:
		modifications = [modificationP]
	modifications.append(modificationP)
	recalculate_cached_values()


func recalculate_cached_values() -> void:
	cached_add_value = 0.0
	cached_multiply_value = 1.0

	for modification in modifications:
		if modification.stat_operation == Modification.ModificationType.ADD:
			cached_add_value += modification.stat_value
		elif modification.stat_operation == Modification.ModificationType.MULTIPLY:
			cached_multiply_value *= modification.stat_value
	
	print("Recalculated modification data for property %s: add %f, multiply %f" % [ModifiableProperty.WeaponPropertyKey.keys()[target_property], cached_add_value, cached_multiply_value])