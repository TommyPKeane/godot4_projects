extends Node
class_name CharacterState

var target_character: CharacterBody2D
var target_animation_player: AnimationPlayer
var target_animation_tree: AnimationTree
var state_machine: CharacterStateMachine
var prev_state: CharacterState
var next_state: CharacterState

@export var can_move: bool = false


func state_input(input: InputEvent):
	push_warning("state_input should be overridden in derived class")
	return


func state_process(delta: float):
	push_warning("state_process should be overridden in derived class")
	return


func state_physics_process(delta: float):
	push_warning("state_physics_process should be overridden in derived class")
	return


func on_enter():
	return


func on_exit():
	return


func state_ready(
	new_state_machine: CharacterStateMachine,
	new_target_character: CharacterBody2D,
	new_target_animation_player: AnimationPlayer,
	new_target_animation_tree: AnimationTree,
):
	state_machine = new_state_machine
	target_character = new_target_character
	target_animation_player = new_target_animation_player
	target_animation_tree = new_target_animation_tree
	# set_process(true)
	set_physics_process(true)
	# set_process_input(true)
	return


func _ready():
	set_process_input(false)
	set_process(false)
	set_physics_process(false)
	target_character = null
	prev_state = null
	next_state = null
	return


func _process(delta):
	pass
	return


func _physics_rocess(delta):
	pass
	return
