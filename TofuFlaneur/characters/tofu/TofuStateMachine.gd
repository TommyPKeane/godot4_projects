extends CharacterStateMachine
class_name TofuStateMachine


func state_machine_ready(
	new_player: CharacterBody2D,
	new_animation_player: AnimationPlayer,
	new_animation_tree: AnimationTree,
):
	super(
		new_player,
		new_animation_player,
		new_animation_tree,
	)
	self.all_states = _find_states_from_child_nodes()
	for tofu_state in all_states:
		tofu_state.state_ready(
			self,
			self.current_character,
			self.current_animation_player,
			self.current_animation_tree,
		)
	self.default_state = $"TofuIdle"
	self.current_state = self.default_state
	# set_process(true)
	set_physics_process(true)
	set_process_input(true)
	return

func _ready():
	super()
	return
