extends Area2D

@export var speed = 1000
@export var bullet_range = 1200

var traveld_distance = 0

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta
	traveld_distance += speed * delta
	
	if traveld_distance > bullet_range:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body is HealthComponent:
		body.damage(1)
