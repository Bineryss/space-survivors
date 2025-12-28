extends RayCast2D

@export var cast_speed := 7000
@export var max_lenght := 1400
@export var growth_time := 0.1
@export var line_width := 20
@export var beam_particle_density := 5
@export var color := Color.WHITE: set = set_color
@export var is_casting := false: set = set_is_casting

@export var damage_tickrate := 0.1
var current_tick := 0.0

var tween: Tween = null

@onready var line_2d: Line2D = $Line2D
@onready var casting_particles_2d: GPUParticles2D = %CastingParticles2D
@onready var collision_particles_2d: GPUParticles2D = %CollisionParticles2D
@onready var beam_particles_up: GPUParticles2D = %BeamParticlesUp
@onready var beam_particles_down: GPUParticles2D = %BeamParticlesDown

func _ready() -> void:
	set_is_casting(is_casting)
	set_physics_process(is_casting)
	set_color(color)

func _physics_process(delta: float) -> void:
	current_tick += delta
	target_position.x = move_toward(
		target_position.x, max_lenght, cast_speed * delta
	)
	var laser_end_position := target_position
	force_raycast_update()
	if is_colliding():
		laser_end_position = to_local(get_collision_point())
		dealing_damage(get_collider())
	line_2d.points[1] = laser_end_position
	configure_particles(laser_end_position)

func dealing_damage(hit_object) -> void:
	if hit_object is not HurtBoxComponent: return
	if current_tick >= damage_tickrate:
		current_tick = 0.0
		hit_object.damage(1)
	
func set_is_casting(value: bool) -> void:
	if is_casting == value: return
	is_casting = value
	set_physics_process(is_casting)
	if not is_casting:
		target_position = Vector2.ZERO
		disappear()
	else:
		appear()

func set_color(value: Color) -> void:
	color = value
	if line_2d == null: return
	line_2d.modulate = value
	casting_particles_2d.modulate = value
	collision_particles_2d.modulate = value
	beam_particles_up.modulate = value
	beam_particles_down.modulate = value

func appear() -> void:
	if line_2d == null: return
	line_2d.points[0] = Vector2.ZERO
	line_2d.points[1] = Vector2.ZERO
	line_2d.show()
	if tween != null and tween.is_running():
		tween.kill()
	tween = create_tween()
	tween.tween_property(line_2d, "width", line_width, growth_time * 2.0).from_current()
	beam_particles_down.emitting = true
	beam_particles_up.emitting = true
	casting_particles_2d.emitting = true
	collision_particles_2d.emitting = true
	
func disappear() -> void:
	if line_2d == null: return
	casting_particles_2d.emitting = false
	collision_particles_2d.emitting = false
	if tween != null and tween.is_running():
		tween.kill()
	tween = create_tween()
	tween.tween_property(line_2d, "width", 0.0, growth_time).from_current()
	tween.tween_callback(cleanup)

func cleanup() -> void:
	line_2d.hide()
	beam_particles_down.emitting = false
	beam_particles_up.emitting = false

func configure_particles(laser_end: Vector2) -> void:
	if beam_particles_down == null: return
	if beam_particles_up == null: return
	if collision_particles_2d == null: return
	if laser_end == null: return
	
	var particle_amount: int = max(floor(laser_end.length() * beam_particle_density / 100), 1) 
	beam_particles_down.process_material.emission_shape_offset.x = laser_end.x / 2
	beam_particles_down.process_material.emission_box_extents.x = laser_end.x / 2
	beam_particles_down.amount = particle_amount
	beam_particles_up.process_material.emission_shape_offset.x = laser_end.x / 2
	beam_particles_up.process_material.emission_box_extents.x = laser_end.x / 2
	beam_particles_up.amount = particle_amount
	
	collision_particles_2d.position = laser_end
