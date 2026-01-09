extends RefCounted
class_name FireContext

#var shooter: Node2D
var muzzle_global: Marker2D
var attack_actor: Node2D
#var aim_dir: Vector2
var projectile_parent: Node # container of all spawned projectiles
var target: Node2D
var data: Dictionary[String, Variant] = {}
#var weapon: WeaponData
