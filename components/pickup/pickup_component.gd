extends Area2D
class_name PickupComponent

@export var value: int = 1
@export var move_speed: float = 300.0

var is_attracted: bool = false
var target_collector: CollectorComponent = null

func activate():
    is_attracted = false
    target_collector = null
    monitoring = true

func deactivate():
    monitoring = false
    is_attracted = false
    target_collector = null
    queue_free()

func attract_to_collector(collector: CollectorComponent):
    if collector is not CollectorComponent: return
    if not is_attracted:
        is_attracted = true
        target_collector = collector

func _physics_process(delta):
    if is_attracted and target_collector:
        var direction = (target_collector.global_position - global_position).normalized()
        global_position += direction * move_speed * delta
