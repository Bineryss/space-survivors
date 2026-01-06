extends RefCounted
class_name SpawnPositionOverride

var has_position := false
var position := Vector2.ZERO

var has_rotation := false
var rotation := 0.0

static func with_rotation(rot: float) -> SpawnPositionOverride:
	var o := SpawnPositionOverride.new()
	o.has_rotation = true
	o.rotation = rot
	return o

static func with_position_and_rotation(pos: Vector2, rot: float) -> SpawnPositionOverride:
	var o := SpawnPositionOverride.new()
	o.has_position = true
	o.position = pos
	o.has_rotation = true
	o.rotation = rot
	return o
