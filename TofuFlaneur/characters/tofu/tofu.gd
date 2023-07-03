extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var screen_size: Vector2
var user_action_state: Actions
var celocity: Vector2

enum Actions {
	PREACH,
	SHARE_DOCUMENT,
	MOVE,
	IDLE,
	STUNNED,
}
	

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	if Input.is_action_pressed("tofu_move_right"):
		$AnimatedSprite2D.flip_h = false
		velocity.x += 1
		user_action_state = Actions.MOVE
		$AnimatedSprite2D.animation = "walk"
	elif Input.is_action_pressed("tofu_move_left"):
		$AnimatedSprite2D.flip_h = true
		velocity.x -= 1
		user_action_state = Actions.MOVE
		$AnimatedSprite2D.animation = "walk"
	elif Input.is_action_pressed("tofu_jump"):
		velocity.y -= 1
		user_action_state = Actions.MOVE
		$AnimatedSprite2D.animation = "walk"
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.animation = "idle"
	
	if Input.is_action_pressed("tofu_preach"):
		user_action_state = Actions.PREACH
	elif Input.is_action_pressed("tofu_share_document"):
		user_action_state = Actions.SHARE_DOCUMENT
	else:
		pass
		

	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
	else:
		pass
	
	position += velocity * delta
	position.x = clamp(position.x, 128, screen_size.x - 128)
	position.y = clamp(position.y, 128, screen_size.y - 128)
	
	user_action_state = Actions.IDLE
	return

func _ready():
	screen_size = get_viewport_rect().size
	hide()
	return

func initialize(start_position):
	position = start_position
	user_action_state = Actions.IDLE
	velocity = Vector2.ZERO
	$CollisionPolygon2D.disabled = false
	self.show()
	$AnimatedSprite2D.animation = "idle"
	$AnimatedSprite2D.play()
	return
	
func hit():
	$StunnedTimer.start()
	user_action_state = Actions.STUNNED
	await $StunnedTimer.timeout
	return
	
func die():
	$AnimatedSprite2D.stop()
	return
