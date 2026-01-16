extends Node

@export var player: PlayerControler = null
@export var upgrade_b: SpawnStrategy = null
@export var upgrade_c: ImpactStrategy = null

func _ready() -> void:
	SignalBus.upgrade_selected.connect(_on_upgrade_selected)

func _on_upgrade_selected(upgrade_id: String) -> void:
	print("Applying upgrade: %s" % upgrade_id)
	match upgrade_id:
		"A":
			player.weapon_data.impact_strategy.damage_amount += 2
			print("Increased weapon damage by 2, is now %d" % player.weapon_data.impact_strategy.damage_amount)
		"B":
			player.weapon_data.spawn_strategy = upgrade_b
			print("Changed weapon spawn strategy to upgrade B")
		"C":
			player.weapon_data.impact_strategy = upgrade_c
			print("Changed weapon impact strategy to upgrade C")
		_:
			print("Unknown upgrade id: %s" % upgrade_id)
