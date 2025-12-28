extends Line2D

@export var target: Node2D
@export var point_spacing := 1          # add a point only when moved this far
@export var point_lifetime := 0.1       # seconds
@export var max_points := 40              # hard cap safety

var ages: Array[float]

func _ready() -> void:
	top_level = true
	clear_points()
	ages.clear()

func _physics_process(delta: float) -> void:
	var p = get_parent().global_position
	if get_point_count() == 0 or points[-1].distance_to(p) >= point_spacing:
		add_point(p)
		ages.append(0.0)

	for i in range(ages.size() -1, -1, -1):
		ages[i] += delta
		if(ages[i] >= point_lifetime):
			remove_point(0)
			ages.remove_at(i)
