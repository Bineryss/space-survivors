extends Node2D

@export var bullet: PackedScene
@export var state_machine: StateMachine

@onready var shooting_point = $ShootingPoint

func shoot():
	if not state_machine.context.has_valid_target(): return
	var new_bullet: Node2D = bullet.instantiate()
	new_bullet.global_position = shooting_point.global_position
	new_bullet.look_at(state_machine.context.target.global_position)
	shooting_point.add_child(new_bullet)
	
func _on_timer_timeout() -> void:
	shoot()
