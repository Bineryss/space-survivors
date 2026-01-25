extends Node

@export var player: PlayerControler = null
@export var modifications: Array[Modification] = []

func _ready() -> void:
	SignalBus.upgrade_selected.connect(_on_upgrade_selected)

func _on_upgrade_selected(upgrade_id: String) -> void:
	var selectedUpgrade: Modification = modifications[randi_range(0, modifications.size() - 1)]
	print("Selected upgrade: %s" % selectedUpgrade.name)
	match upgrade_id:
		"A":
			player.change_weapon(_create_new_weapon_data_with(selectedUpgrade))
		"B":
			player.change_weapon(_create_new_weapon_data_with(modifications[1]))
		"C":
			player.change_weapon(_create_new_weapon_data_with(modifications[2]))
		_:
			print("Unknown upgrade id: %s" % upgrade_id)

func _create_new_weapon_data_with(modification: Modification) -> WeaponData:
	var new_weapon_data: WeaponData = player.weapon_data

	for atomic_modification in modification.modifications:
		print("Applying atomic modification to %s" % ModifiableProperty.WeaponPropertyKey.keys()[atomic_modification.target_prop])
		var exisiting_modification_data: ModificationData = new_weapon_data.active_modifications.get(atomic_modification.target_prop)
		if exisiting_modification_data != null:
			exisiting_modification_data.add_modification(atomic_modification as Modification)
		else:
			var modification_data: ModificationData = ModificationData.with_modification(atomic_modification, atomic_modification.target_prop)
			new_weapon_data.active_modifications[atomic_modification.target_prop] = modification_data

	if modification.modifications.size() > 0:
		return new_weapon_data

	var exisiting_modification_data: ModificationData = new_weapon_data.active_modifications.get(modification.target_prop)
	if exisiting_modification_data != null:
		exisiting_modification_data.add_modification(modification)
	else:
		var modification_data: ModificationData = ModificationData.with_modification(modification, modification.target_prop)
		new_weapon_data.active_modifications[modification.target_prop] = modification_data

	return new_weapon_data
