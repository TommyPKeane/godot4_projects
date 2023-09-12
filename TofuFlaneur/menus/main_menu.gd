extends CanvasLayer

signal start_game
signal open_options_menu
signal quit_game


func on_toggle_visibility():
	if self.visible:
		show_main_menu()
	else:
		hide_main_menu()
	return

func hide_main_menu():
	$GameTitle.stop()
	return
	
func show_main_menu():
#	$TextureRect.show()
#	var title_animation_size = $GameTitle.sprite_frames.get_frame_texture("idle",0).get_size()
#	$GameTitle.position = Vector2(
#		(get_viewport().size.x / 2),
#		(get_viewport().size.y / 2) - (title_animation_size.y / 2.5),
#	)
#	$GameTitle.show()
#	$GameTitle.play("idle")
#	$MenuButtons.show()
	return

# Called when the node enters the scene tree for the first time.
func _ready():
	on_toggle_visibility()
	return

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit() # default behavior
	else:
		pass
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	return

func show_game_over(score):
	print("Game Over")
	print(score)
	return
