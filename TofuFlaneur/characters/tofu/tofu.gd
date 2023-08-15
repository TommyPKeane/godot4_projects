extends CharacterBody2D

enum Actions {
	NULL = -1,
	PREACH = 0,
	SHARE_DOCUMENT = 1,
	MOVE = 2,
	IDLE = 3,
	STUNNED = 4,
}

class UserAction:
	var crnt_state: Actions
	var prev_state: Actions
	var animation_active: bool
	
	func _init(init_state: Actions):
		self.crnt_state = init_state
		self.prev_state = Actions.NULL
		self.animation_active = false
		return
		
	func loop_animation():
		self.animation_active = false
		return
		
	func finish_animation():
		self.animation_active = false
		return
		
	func change_to_state(new_state: Actions):
		var state_changed = false
		var same_state = new_state == self.crnt_state
		if same_state or self.animation_active:
			state_changed = false
		else:
			self.prev_state = self.crnt_state
			self.crnt_state = new_state
			self.animation_active = true
			state_changed = true
		return state_changed
		
	func get_animation_name():
		var animation_name = ""
		match self.crnt_state:
			Actions.PREACH:
				animation_name = "preach"
			Actions.SHARE_DOCUMENT:
				animation_name = "share_document"
			Actions.MOVE:
				animation_name = "walk"
			Actions.IDLE:
				animation_name = "idle"
			Actions.STUNNED:
				animation_name = "stunned"
		return animation_name


const SPEED = 50.0  # [pixels]/[frame]
const JUMP_VELOCITY = -400.0
var screen_size: Vector2
var tofu_state: UserAction

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _input(event):
	var state_changed = false
	if event.is_action_pressed("tofu_move_right"):
		$"TofuSprite".flip_h = false
		velocity.x += 1
		state_changed = tofu_state.change_to_state(Actions.MOVE)
	elif event.is_action_pressed("tofu_move_left"):
		$"TofuSprite".flip_h = true
		velocity.x -= 1
		state_changed = tofu_state.change_to_state(Actions.MOVE)
	elif event.is_action_pressed("tofu_jump"):
		velocity.y -= 1
		state_changed = tofu_state.change_to_state(Actions.MOVE)
	else:
		velocity = Vector2.ZERO
		state_changed = tofu_state.change_to_state(Actions.IDLE)

	if state_changed:
		$"TofuSprite".animation = tofu_state.get_animation_name()
	else:
		pass
	
	if event.is_action_pressed("tofu_preach"):
		pass
	elif event.is_action_pressed("tofu_share_document"):
		pass
	else:
		pass
	return

func _physics_process(delta: float):
	_input(Input)
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
	else:
		pass
	
	position += velocity * delta
	position.x = clamp(position.x, 128, screen_size.x - 128)
	position.y = clamp(position.y, 128, screen_size.y - 128)
	
	# user_action_state = Actions.IDLE
	# move_and_slide()
	return

func _ready():
	tofu_state = UserAction.new(Actions.IDLE)
	screen_size = get_viewport_rect().size
	hide()
	return

func initialize(start_position):
	position = start_position
	velocity = Vector2.ZERO
	$"TofuCollisionPolygon".disabled = false
	show()
	$"TofuSprite".animation = tofu_state.get_animation_name()
	$"TofuSprite".animation_looped.connect(tofu_state.loop_animation)
	$"TofuSprite".animation_finished.connect(tofu_state.finish_animation)
	$"TofuSprite".play()
	return
	
func hit():
	$"StunnedTimer".start()
	# user_action_state = Actions.STUNNED
	await $"StunnedTimer".timeout
	return
	
func die():
	$"TofuSprite".stop()
	return
