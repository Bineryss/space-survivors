extends TargetStrategy
class_name NearestEnemyTarget

@export var detection_radius: float = 1500.0

func get_target(from: Node2D) -> Node2D:
    var space_state = from.get_world_2d().direct_space_state
    var query = PhysicsShapeQueryParameters2D.new()
    
    # Create circle shape for detection
    var shape = CircleShape2D.new()
    shape.radius = detection_radius
    query.shape = shape
    query.transform = Transform2D(0, from.global_position)
    query.collision_mask = target_layers
    query.collide_with_areas = true
    query.collide_with_bodies = true
    
    # Find all enemies in range
    var results = space_state.intersect_shape(query)
    
    if results.is_empty():
        return null
    
    # Find nearest
    var nearest: Node2D = null
    var nearest_dist_sq = INF
    
    for result in results:
        var target_node = result.collider
        var dist_sq = from.global_position.distance_squared_to(target_node.global_position)
        if dist_sq < nearest_dist_sq:
            nearest_dist_sq = dist_sq
            nearest = target_node
    
    return nearest
