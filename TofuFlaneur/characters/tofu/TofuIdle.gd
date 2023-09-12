extends CharacterState
class_name TofuIdle


func state_input(input: InputEvent):
	# super(input)
	if (input.is_action_pressed("tofu_move_left")):
		next_state = $"TofuWalking"
	elif (input.is_action_pressed("tofu_move_right")):
		next_state = $"TofuWalking"
	elif (input.is_action_pressed("tofu_jump")):
		next_state = $"TofuJump"
	else:
		next_state = null
	return


func state_physics_process(delta: float):
	if (!target_character.is_on_floor()):
		next_state = $"TofuJump"
	elif (target_character.is_on_floor_only()):
		# next_state = $"TofuJump"
		pass
	elif (target_character.is_on_wall_only()):
		# next_state = $"TofuJump"
		pass
	else:
		pass
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
	self.can_move = true
	return


func _ready():
	super()
	return


func _process(delta):
	# super(delta)
	return


func _physics_rocess(delta):
	# super(delta)
	return
