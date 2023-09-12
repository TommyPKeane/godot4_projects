# State Machine Base Class for 2D Characters
#
# References:
# - https://www.youtube.com/watch?v=fuGiJdMrCAk
extends Node
class_name CharacterStateMachine

@export var current_character: CharacterBody2D
@export var current_animation_player: AnimationPlayer
@export var current_animation_tree: AnimationTree
@export var current_state: CharacterState

@export var walking_velocity_px_fr = 50.0  # [pixels]/[frame]
@export var running_velocity_px_fr = 100.0  # [pixels]/[frame]
@export var jump_velocity_px_fr = -400.0  # [pixels]/[frame]

var all_states: Array[CharacterState]
var default_state: CharacterState


func state_machine_ready(
	new_player: CharacterBody2D,
	new_animation_player: AnimationPlayer,
	new_animation_tree: AnimationTree
):
	current_character = new_player
	current_animation_player = new_animation_player
	current_animation_tree = new_animation_tree
	return


func can_move() -> bool:
	return self.current_state.can_move


func change_state(new_state: CharacterState):
	var prev_state = current_state
	if (current_state != null):
		current_state.on_exit()
		current_state.next_state = null
	else:
		pass
	current_state = new_state
	current_state.prev_state = prev_state
	current_state.next_state = null
	current_state.on_enter()
	return


func _input(event: InputEvent):
	current_state.state_input(event)
	return


func _find_states_from_child_nodes() -> Array[CharacterState]:
	var child_states: Array[CharacterState] = []
	for child_node in get_children():
		if (child_node is CharacterState):
			child_states.append(child_node)
		else:
			push_warning("Child Node is not a CharacterState")
	return child_states


func _ready():
	set_process_input(false)
	set_process(false)
	set_physics_process(false)
	return


func _process(delta: float):
	# current_state.state_process(delta)
	return


func _physics_process(delta: float):
	if (self.current_state.next_state != null):
		change_state(current_state.next_state)
	else:
		pass
	current_state.state_physics_process(delta)
	return
