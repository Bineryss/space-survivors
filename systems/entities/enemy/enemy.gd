class_name Enemy extends CharacterBody2D

var target: Node2D

func _physics_process(_delta: float) -> void:
	move_and_slide()

func _on_vision_area_body_entered(body: Node2D) -> void:
	if body is PlayerControler: target = body


func _on_vision_area_body_exited(body: Node2D) -> void:
	if body is PlayerControler: target = null
