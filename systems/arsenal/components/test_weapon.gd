extends Marker2D

@export var spawn_strategy: SpawnStrategy
@export var bullet: PackedScene
@export var bullet_root: Node2D

var is_shooting: bool = false

func _input(event: InputEvent) -> void:
	if not event.is_action_pressed("primary_action"): return
	if is_shooting: return
	is_shooting = true
	var fire_context : FireContext = FireContext.new()
	fire_context.muzzle_global = self
	fire_context.projectile_parent = bullet_root
	
	var weapon_data = WeaponData.new()
	weapon_data.attack_actor_scene = bullet
	await spawn_strategy.execute(fire_context, weapon_data) # await is correct here, problem with gdscript
	is_shooting = false
