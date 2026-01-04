class_name MoveInRangeOfTarget extends State

@export var follow_speed: float = 400.0

@export var idle_state: State
@export var attack_state: State

var out_of_range: bool

func physics_update(_delta: float) -> State:
	var target: Node2D = context.target
	if not target: return idle_state
	if context.in_range: return attack_state
	
	context.actor.look_at(target.global_position)
	var direction: Vector2 = context.actor.global_position.direction_to(target.global_position)
	context.actor.velocity = direction * follow_speed
	return
