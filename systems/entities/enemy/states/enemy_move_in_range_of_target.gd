class_name MoveInRangeOfTarget extends State

@export var desired_distance: float = 500.0
@export var follow_speed: float = 400.0

@export var enemy: Enemy
@export var idle_state: State
@export var attack_state: State

var out_of_range: bool

func physics_update(_delta: float) -> State:
	var target: Node2D = enemy.target
	if not target: return idle_state
	
	var distance = enemy.global_position.distance_to(target.global_position)
	if distance < desired_distance: return attack_state
	
	enemy.look_at(target.global_position)
	var direction: Vector2 = enemy.global_position.direction_to(target.global_position)
	enemy.velocity = direction * follow_speed
	return
