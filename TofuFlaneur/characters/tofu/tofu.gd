# Tofu Character
#
# References:
# - https://www.youtube.com/watch?v=fuGiJdMrCAk
extends CharacterBody2D

# Exports
@export var screen_size: Vector2


# Class Member Variables
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")  # Get the gravity from the project settings to be synced with RigidBody nodes.
var direction: Vector2


func initialize(start_position):
	self.position = start_position
	self.velocity = Vector2.ZERO
	self.direction = Vector2.ZERO
	$"TofuCollisionPolygon".disabled = false
	$"TofuSpriteAnimationTree".active = true
	$"DebugElements/AnimationLabel".label_ready($"TofuStateMachine")
	$"DebugElements/StateMachineLabel".label_ready($"TofuStateMachine")
	$"TofuStateMachine".state_machine_ready(
		self,
		$"TofuSpriteAnimationPlayer",
		$"TofuSpriteAnimationTree",
	)
	self.show()
	set_physics_process(true)
	set_process(true)
	set_process_input(true)
	return


func update_direction():
	$"TofuSprite".flip_h = (self.direction.x < 0)
	$"TofuSprite".flip_v = false
	return


func update_animation_tree_config():
	$"TofuSpriteAnimationTree".set(
		"parameters/MovingBlend1D/blend_position",
		self.direction.x,
	)
	return


func _input(event: InputEvent):
	return

	
func _process(delta: float):
	return


func _physics_process(delta: float):
	self.direction = Input.get_vector("left", "right", "up", "down")
	update_direction()
	if self.is_on_floor():
		self.velocity += gravity * delta
	else:
		pass
	if self.direction.x != 0 && $"TofuStateMachine".can_move():
		self.velocity.x = self.direction.x * $"TofuStateMachine".walking_velocity_px_fr
	else:
#		self.velocity.x = move_toward(self.velocity.x, 0, $"TofuStateMachine".walking_velocity_px_fr)
		pass
	self.position += self.velocity * delta
	self.position.x = clamp(self.position.x, 128, screen_size.x - 128)
	self.position.y = clamp(self.position.y, 128, screen_size.y - 128)
	move_and_slide()
	update_animation_tree_config()
	return


func _ready():
	screen_size = get_viewport_rect().size
	hide()
	set_physics_process(false)
	set_process(false)
	set_process_input(false)
	return
