class_name Enemy extends CharacterBody2D

@export var state_machine: StateMachine

func _ready() -> void:
	state_machine.init(self)

func _physics_process(_delta: float) -> void:
	move_and_slide()

func _on_vision_area_body_entered(body: Node2D) -> void:
	if body is PlayerControler: state_machine.context.target = body


func _on_vision_area_body_exited(body: Node2D) -> void:
	if body is PlayerControler: state_machine.context.target = null


func _on_shooting_range_body_entered(body: Node2D) -> void:
	if body is PlayerControler: state_machine.context.in_range = true


func _on_shooting_range_body_exited(body: Node2D) -> void:
	if body is PlayerControler: state_machine.context.in_range = false


func _on_health_component_health_depleated() -> void:
	print("dead")
	queue_free()
