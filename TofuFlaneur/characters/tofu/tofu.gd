extends CharacterBody2D


const SPEED = 50.0  # [pixels]/[frame]
const JUMP_VELOCITY = -400.0
var screen_size: Vector2
var user_action_state: Actions

enum Actions {
	PREACH,
	SHARE_DOCUMENT,
	MOVE,
	IDLE,
	STUNNED,
}
	

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _input(event):
	if event.is_action_pressed("tofu_move_right"):
		$"TofuSprite".flip_h = false
		velocity.x += 1
		user_action_state = Actions.MOVE
		$"TofuSprite".animation = "walk"
	elif event.is_action_pressed("tofu_move_left"):
		$"TofuSprite".flip_h = true
		velocity.x -= 1
		user_action_state = Actions.MOVE
		$"TofuSprite".animation = "walk"
	elif event.is_action_pressed("tofu_jump"):
		velocity.y -= 1
		user_action_state = Actions.MOVE
		$"TofuSprite".animation = "walk"
	else:
		velocity = Vector2.ZERO
		$"TofuSprite".animation = "idle"
	
	if event.is_action_pressed("tofu_preach"):
		user_action_state = Actions.PREACH
	elif event.is_action_pressed("tofu_share_document"):
		user_action_state = Actions.SHARE_DOCUMENT
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
	
	user_action_state = Actions.IDLE
	move_and_slide()
	return

func _ready():
	screen_size = get_viewport_rect().size
	hide()
	return

func initialize(start_position):
	position = start_position
	user_action_state = Actions.IDLE
	velocity = Vector2.ZERO
	$"TofuCollisionPolygon".disabled = false
	show()
	$"TofuSprite".animation = "idle"
	$"TofuSprite".play()
	return
	
func hit():
	$"StunnedTimer".start()
	user_action_state = Actions.STUNNED
	await $"StunnedTimer".timeout
	return
	
func die():
	$"TofuSprite".stop()
	return
