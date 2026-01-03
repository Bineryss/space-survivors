class_name EnemyCircle extends State

@export var enemy: Enemy
@export var move_speed: float = 80.0
@export var follow_state: State
@export var idle_state: State
@export var shooting_range: float = 500.0
@export var shoot_cooldown: float = 1.0

var shoot_timer: float = 0.0

func enter() -> void:
	shoot_timer = 0.5 # Shoot shortly after entering

func physics_update(delta: float) -> State:
	if not enemy.target:
		return idle_state
		
	var dist = enemy.global_position.distance_to(enemy.target.global_position)
	
	# TRANSITION: If player runs away, chase them again
	# We add a buffer (e.g. + 20) to prevent rapid flickering between states
	if dist > shooting_range + 20.0:
		return follow_state

	# LOGIC 1: Circle/Strafe
	# Calculate vector pointing to player
	var dir_to_player = (enemy.target.global_position - enemy.global_position).normalized()
	
	# Calculate a vector perpendicular to the player (Cross product / Orthogonal)
	# This creates the "circling" movement
	var strafe_dir = Vector2(-dir_to_player.y, dir_to_player.x) 
	
	enemy.velocity = strafe_dir * move_speed
	enemy.look_at(enemy.target.global_position)
	
	# LOGIC 2: Shooting
	shoot_timer -= delta
	if shoot_timer <= 0:
		shoot()
		shoot_timer = shoot_cooldown
		
	return null

func shoot() -> void:
	# Implement your bullet instantiation here
	print("Bang!")
