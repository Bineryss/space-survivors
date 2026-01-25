extends Resource
class_name WeaponConfig

@export var attack_actor_scene: PackedScene
@export var projectile_color: ProjectileColor = null
@export_flags_2d_physics var collision_masks: int = 0

@export_category("Strategies")
@export var target_strategy: TargetStrategy = null
@export var spawn_strategy: SpawnStrategy = null
@export var trajectory_strategy: TrajectoryStrategy = null
@export var impact_strategy: ImpactStrategy = null
@export var despawn_strategy: DespawnStrategy = null

func get_data() -> WeaponData:
	var data := WeaponData.new()
	data.attack_actor_scene = attack_actor_scene
	data.projectile_color = projectile_color
	data.collision_masks = collision_masks
	data.target_strategy = target_strategy
	data.spawn_strategy = spawn_strategy
	data.trajectory_strategy = trajectory_strategy
	data.impact_strategy = impact_strategy
	data.despawn_strategy = despawn_strategy
	return data