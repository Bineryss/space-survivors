extends DespawnStrategy
class_name DespawnByTime

const LIFETIME = "lifetime"

@export var max_lifetime: float = 5.0

func should_despawn(_attack_actor: Node2D, delta: float, ctx: FireContext) -> bool:
    if not ctx.data.has(LIFETIME):
        ctx.data[LIFETIME] = 0.0

    var lifetime = ctx.data[LIFETIME]
    lifetime += delta
    ctx.data[LIFETIME] = lifetime
    
    return lifetime >= max_lifetime
