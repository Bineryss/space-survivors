class_name EnemyContext extends RefCounted

var actor: CharacterBody2D
var target: Node2D
var in_range: bool


func has_valid_target() -> bool:
	return is_instance_valid(target)
