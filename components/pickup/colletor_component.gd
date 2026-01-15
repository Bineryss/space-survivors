@tool
extends Node2D
class_name CollectorComponent

signal pickup_collected

@export var attraction_radius: float = 1000.0:
	set(value):
		attraction_radius = value
		_update_attraction_radius()
@export var collection_radius: float = 10.0:
	set(value):
		collection_radius = value
		_update_collection_radius()
@export var debug_draw: bool = false

@onready var attraction_area: Area2D = %AttractionArea
@onready var collection_area: Area2D = %CollectionArea
@onready var attraction_shape: CollisionShape2D = %AttractionArea/CollisionShape2D
@onready var collection_shape: CollisionShape2D = %CollectionArea/CollisionShape2D

func _draw() -> void:
	if not debug_draw: return
	draw_circle(Vector2.ZERO, attraction_radius, Color(0, 1, 0, 0.2))
	draw_circle(Vector2.ZERO, collection_radius, Color(1, 0, 0, 0.4))

func _ready() -> void:
	attraction_shape.shape.radius = attraction_radius
	collection_shape.shape.radius = collection_radius

	if Engine.is_editor_hint(): return

	attraction_area.area_entered.connect(_on_attraction_entered)
	collection_area.area_entered.connect(_on_collection_entered)

func _on_attraction_entered(body: Node) -> void:
	if body is not PickupComponent: return

	var pickup: PickupComponent = body
	pickup.attract_to_collector(self)

func _on_collection_entered(body: Node) -> void:
	if body is not PickupComponent: return
	collect_pickup(body)

func collect_pickup(pickup: PickupComponent) -> void:
	pickup_collected.emit()
	pickup.deactivate()


## tool functions ##
func _update_attraction_radius() -> void:
	if not is_inside_tree(): return
		
	var shape = get_node_or_null("%AttractionArea/CollisionShape2D")
	if shape and shape.shape:
		shape.shape.radius = attraction_radius

func _update_collection_radius() -> void:
	if not is_inside_tree(): return

	var shape = get_node_or_null("%CollectionArea/CollisionShape2D")
	if shape and shape.shape:
		shape.shape.radius = collection_radius
