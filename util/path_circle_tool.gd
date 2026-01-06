@tool
extends Path2D

@export var radius: float = 500.0:
	set(value):
		radius = value
		_update_path()

func _ready() -> void:
	_update_path()

func _update_path() -> void:
	# Get the curve resource (or create one if missing)
	if not curve:
		curve = Curve2D.new()
	
	curve.clear_points()
	
	# 4-point Bezier approximation for a circle
	# The control point length for a perfect circle is radius * (4/3) * tan(pi/8) ≈ 0.5522847
	var handle_len = radius * 0.5522847
	
	# Add 4 points: Top, Right, Bottom, Left
	# Format: add_point(position, in_control, out_control)
	
	# Top Point (0, -R)
	curve.add_point(Vector2(0, -radius), Vector2(-handle_len, 0), Vector2(handle_len, 0))
	
	# Right Point (R, 0)
	curve.add_point(Vector2(radius, 0), Vector2(0, -handle_len), Vector2(0, handle_len))
	
	# Bottom Point (0, R)
	curve.add_point(Vector2(0, radius), Vector2(handle_len, 0), Vector2(-handle_len, 0))
	
	# Left Point (-R, 0)
	curve.add_point(Vector2(-radius, 0), Vector2(0, handle_len), Vector2(0, -handle_len))
	
	# Close the loop by adding the Top point again with the 'in' handle
	curve.add_point(Vector2(0, -radius), Vector2(-handle_len, 0), Vector2(handle_len, 0))
