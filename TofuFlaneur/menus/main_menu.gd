extends CanvasLayer

signal start_game
signal open_options_menu
signal quit_game


func update_score(score):
	# $ScoreLabel.text = str(score)
	# print(score)
	return


func _on_start_button_pressed():
	start_game.emit()
	return

func _on_options_button_pressed():
	open_options_menu.emit()
	return

func _on_quit_button_pressed():
	quit_game.emit()
	return

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureRect.show()
	var title_animation_size = $GameTitle.sprite_frames.get_frame_texture("idle",0).get_size()
	$GameTitle.position = Vector2(
		(get_viewport().size.x / 2),
		(get_viewport().size.y / 2) - (title_animation_size.y / 2.5),
	)
	$GameTitle.show()
	$GameTitle.play("idle")
	$MenuButtons.show()
	pass # Replace with function body.

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit() # default behavior

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_game_over(score):
	print("Game Over")
	print(score)
	return
