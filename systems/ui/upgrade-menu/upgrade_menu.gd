extends HBoxContainer
class_name UpgradeMenu

signal upgrade_selected(id: String)

@onready var upgrade_1: Button = %Upgrade1
@onready var upgrade_2: Button = %Upgrade2
@onready var upgrade_3: Button = %Upgrade3

func _ready() -> void:
	upgrade_1.pressed.connect(func() -> void:
		handle_upgrade_selection("A")
	)
	upgrade_2.pressed.connect(func() -> void:
		handle_upgrade_selection("B")
	)
	upgrade_3.pressed.connect(func() -> void:
		handle_upgrade_selection("C")
	)

func handle_upgrade_selection(upgrade_id: String) -> void:
	upgrade_selected.emit(upgrade_id)
	
# TODO: think of proper way to set upgrade options with icons, rarity, description, etc.
func set_upgrade_options(options: Array[String]) -> void:
	upgrade_1.text = options[0]
	upgrade_2.text = options[1]
	upgrade_3.text = options[2]