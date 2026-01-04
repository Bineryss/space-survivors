extends Node
class_name StateMachine

@export var initial_state: State

var current_state: State
var context: EnemyContext

func init(actor: CharacterBody2D) -> void:
	context = EnemyContext.new()
	context.actor = actor
	
	for child in get_children():
		if child is State:
			child.context = context
	change_state(initial_state)
	

func _process(delta: float) -> void:
	tick(false, delta)

func _physics_process(delta: float) -> void:
	tick(true, delta)

func tick(is_physics: bool, delta: float) -> void:
	if current_state == null: return
	var next_state = null
	if is_physics:
		next_state = current_state.physics_update(delta)
	else:
		next_state = current_state.update(delta)
	
	if next_state: change_state(next_state)
	

func change_state(next_state: State) -> void:
	if current_state: current_state.exit()
	next_state.enter()
	current_state = next_state
