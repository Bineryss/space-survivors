@abstract
extends Resource
class_name TargetStrategy

@export_flags_2d_physics var target_layers: int = 0

@abstract
func get_target(from: Node2D) -> Node2D
