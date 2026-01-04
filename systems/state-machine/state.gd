@abstract
class_name State extends Node

var context: EnemyContext

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(_delta: float) -> State:
	return null

func physics_update(_delta: float) -> State:
	return null
