extends Resource
class_name WeaponData

@export var attack_actor_scene: PackedScene
@export var projectile_color: ProjectileColor = null
@export_flags_2d_physics var collision_masks: int = 0

@export_category("Strategies")
@export var target_strategy: TargetStrategy = null
@export var spawn_strategy: SpawnStrategy = null
@export var trajectory_strategy: TrajectoryStrategy = null
@export var impact_strategy: ImpactStrategy = null
@export var despawn_strategy: DespawnStrategy = null
