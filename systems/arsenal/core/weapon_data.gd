extends RefCounted
class_name WeaponData

var active_modifications: Dictionary[ModifiableProperty.WeaponPropertyKey, ModificationData] = {}
var active_stat_modifications: Dictionary[ModifiableProperty.WeaponPropertyKey, float] = {}

# TODO: Remove depercrated values once all weapons have been updated
var attack_actor_scene: PackedScene
var projectile_color: ProjectileColor = null
var collision_masks: int = 0

var target_strategy: TargetStrategy = null
var spawn_strategy: SpawnStrategy = null
var trajectory_strategy: TrajectoryStrategy = null
var impact_strategy: ImpactStrategy = null
var despawn_strategy: DespawnStrategy = null
