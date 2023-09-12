extends CharacterState
class_name TofuSeasoning


func state_input(input: InputEvent):
	return


func state_ready(
	new_state_machine: CharacterStateMachine,
	new_target_character: CharacterBody2D,
	new_target_animation_player: AnimationPlayer,
	new_target_animation_tree: AnimationTree,
):
	super(
		new_state_machine,
		new_target_character,
		new_target_animation_player,
		new_target_animation_tree,
	)
	self.can_move = false
	return


func _ready():
	super()
	return


func _process(delta):
	pass
	return


func _physics_rocess(delta):
	pass
	return
