extends CharacterBody2D
class_name PlayerControler

@export var max_speed := 800
@export var time_to_max := 0.2
@export var time_to_stop := 0.12

@export var angular_speed := 5

@export_group("Arsenal")
@export var weapon_data: WeaponData = null
@export var bullet_root: Node2D = null

@onready var weapon_component: WeaponComponent = %WeaponComponent

var acceleration : float
var deceleration : float

func _ready() -> void:
	acceleration = max_speed / time_to_max
	deceleration = max_speed / time_to_stop
	weapon_component.init(bullet_root, weapon_data)

func _physics_process(delta: float) -> void:
	var input_dir: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var target_velocity = input_dir * max_speed
	if input_dir.length() > 0.0:
		velocity = velocity.move_toward(target_velocity, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	
	move_and_slide()
	handle_mouse_aim(delta)


func handle_mouse_aim(delta: float) -> void:
	var target_angle = (get_global_mouse_position() - global_position).angle()
	rotation = lerp_angle(rotation, target_angle, angular_speed * delta)
	
func _on_health_component_health_depleated() -> void:
	print("player death")


func _on_shoot_timer_timeout() -> void:
	weapon_component.try_shoot()
