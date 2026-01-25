extends TrajectoryStrategy
class_name TrajectoryStraight

@export var speed: int = 1200

func step(attack_actor: Node2D, delta: float, _ctx: FireContext, data: WeaponData) -> void:
    attack_actor.position += attack_actor.transform.x * _calc_speed(data) * delta

func _calc_speed(data: WeaponData) -> float:
    return ModificationMapper.get_modified_value(ModifiableProperty.WeaponPropertyKey.PROJECTILE_SPEED, speed, data.active_modifications)