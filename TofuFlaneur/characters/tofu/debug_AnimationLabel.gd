extends Label


@export var character_state_machine: CharacterStateMachine


func label_ready(
	new_character_state_machine,
):
	character_state_machine = new_character_state_machine
	set_process(true)
	return

func _ready():
	set_process(false)
	return


func _process(delta):
	self.position = character_state_machine.current_character.position - Vector2(0, 32)
	self.text = "Current State: " + character_state_machine.current_state.name
	return
