class_name EnemyIdle extends State

@export var enemy: Enemy
@export var move_speed: float = 100.0
@export var follow_state: State

var move_direction: Vector2
var wander_time: float

func randomize_patrol() -> void:
	move_direction = Vector2(randf_range(-1, 1),randf_range(-1, 1)).normalized()
	wander_time = randf_range(1, 3)
	if enemy: enemy.look_at(enemy.global_position + move_direction)

func enter() -> void:
	randomize_patrol()

func update(delta: float) -> State:
	if enemy.target: return follow_state
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_patrol()
	return null

func physics_update(_delta: float) -> State:
	if not enemy: return
	enemy.velocity = move_direction * move_speed
	return null
