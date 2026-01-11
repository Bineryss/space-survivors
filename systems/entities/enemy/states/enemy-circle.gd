class_name EnemyCircle extends State

signal fire_signal

@export var move_speed: float = 80.0
@export var follow_state: State
@export var idle_state: State
@export var shoot_cooldown: float = 1.0

var shoot_timer: float = 0.0
var desired_distance: float = 0.0

func enter() -> void:
	shoot_timer = 0.5

func physics_update(delta: float) -> State:
	if not context.target:
		return idle_state
	
	var distance = context.actor.global_position.distance_to(context.target.global_position)
	if context.in_range:
		desired_distance = distance
	
	if distance > desired_distance + 20.0:
		return follow_state

	var dir_to_player = (context.target.global_position - context.actor.global_position).normalized()
	
	var strafe_dir = Vector2(-dir_to_player.y, dir_to_player.x) 
	
	context.actor.velocity = strafe_dir * move_speed
	context.actor.look_at(context.target.global_position)
	
	shoot_timer -= delta
	if shoot_timer <= 0:
		shoot()
		shoot_timer = shoot_cooldown
		
	return null

func shoot() -> void:
	fire_signal.emit()
