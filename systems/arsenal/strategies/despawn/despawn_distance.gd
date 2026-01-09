extends DespawnStrategy
class_name DespawnByDistance

const DISTANCE_TRAVELED = "distance_traveled"
const LAST_POSITION = "last_position"


@export var max_distance: float = 2000.0

func should_despawn(attack_actor: Node2D, _delta: float, ctx: FireContext) -> bool:
    if not ctx.data.has(DISTANCE_TRAVELED):
        ctx.data[DISTANCE_TRAVELED] = 0.0
        ctx.data[LAST_POSITION] = attack_actor.global_position
        return false

    var last_pos = ctx.data[LAST_POSITION]
    var traveled = ctx.data[DISTANCE_TRAVELED]
    
    var distance_delta = last_pos.distance_to(attack_actor.global_position)
    traveled += distance_delta
    
    ctx.data[DISTANCE_TRAVELED] = traveled
    ctx.data[LAST_POSITION] = attack_actor.global_position
    
    return traveled >= max_distance
