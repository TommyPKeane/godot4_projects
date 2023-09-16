extends Label


@export var character_state_machine: CharacterStateMachine
@export var label_offset: Vector2


func label_ready(
	new_character_state_machine: CharacterStateMachine,
	new_label_offset: Vector2 = Vector2(0, -32),
):
	character_state_machine = new_character_state_machine
	label_offset = new_label_offset
	set_process(true)
	return


func _process(delta):
	self.position = character_state_machine.current_character.position + label_offset
	self.text = "Current State: " + character_state_machine.current_state.name
	return


func _ready():
	set_process(false)
	return
