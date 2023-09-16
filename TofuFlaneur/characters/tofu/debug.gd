extends Node


func initialize_debug(
	new_character_state_machine: CharacterStateMachine,
	state_machine_label_offset: Vector2 = Vector2(0, -32),
	animation_label_offset: Vector2 = Vector2(0, -16),
):
	$"StateMachineLabel".label_ready(
		new_character_state_machine,
		state_machine_label_offset,
	)
	$"AnimationLabel".label_ready(
		new_character_state_machine,
		animation_label_offset,
	)
	return


func _ready():
	return
