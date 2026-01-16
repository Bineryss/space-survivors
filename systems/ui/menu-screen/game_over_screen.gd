extends VBoxContainer
class_name GameOverScreen

signal restart_game_requested
signal return_to_main_menu

@onready var restart_button: Button = %RestartButton
@onready var main_menu_button: Button = %MainMenuButton

func _ready() -> void:
	restart_button.pressed.connect(restart_game_requested.emit)
	main_menu_button.pressed.connect(return_to_main_menu.emit)
