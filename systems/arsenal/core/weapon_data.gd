extends Resource
class_name WeaponData

@export_group("Stats")
@export var base_damage: float = 1.0
@export var base_cooldown: float = 1.0
@export var projectile_speed: float = 400.0

@export_group("Strategies")
@export var attack_actor_scene: PackedScene
@export var spawn_strategy: SpawnStrategy = null
@export var trajectory_strategy: TrajectoryStrategy = null