@abstract
extends Resource
class_name DespawnStrategy

@abstract
func should_despawn(attack_actor: Node2D, delta: float, ctx: FireContext) -> bool