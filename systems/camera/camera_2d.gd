extends Camera2D

@export var target: CharacterBody2D
@export var follow_half_life := 0.12  # seconds; smaller = snappier
@export var lookahead_distance := 120.0 # pixels in front of ship
@export var lookahead_half_life := 0.18 # smooth the offset itself
@export var min_velocity_for_lookahead := 600

var _lookahead_offset := Vector2.ZERO

#var desired_position_debug := Vector2.ZERO
#func _draw() -> void:
	#draw_circle(to_local(desired_position_debug), 20, Color.ROYAL_BLUE)

func _process(delta: float) -> void:
	if target == null:
		return

	var v := target.velocity
	var desired_offset := Vector2.ZERO
	if v.length() > min_velocity_for_lookahead:
		desired_offset = v.normalized() * lookahead_distance

	_lookahead_offset = _exp_smooth_vec2(_lookahead_offset, desired_offset, lookahead_half_life, delta)

	var desired_pos := target.global_position + _lookahead_offset
	#desired_position_debug = desired_pos
	#queue_redraw()
	global_position = _exp_smooth_vec2(global_position, desired_pos, follow_half_life, delta)


func _exp_smooth_vec2(current: Vector2, target2: Vector2, half_life: float, delta: float) -> Vector2:
	if half_life <= 0.0:
		return target2
	var t := 1.0 - pow(0.5, delta / half_life)
	return current.lerp(target2, t)
