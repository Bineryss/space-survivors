extends Resource
class_name WeaponData

@export var attack_actor_scene: PackedScene

@export_group("Strategies")
@export var spawn_strategy: SpawnStrategy = null
@export var trajectory_strategy: TrajectoryStrategy = null
@export var impact_strategy: ImpactStrategy = null
@export var despawn_strategy: DespawnStrategy = null