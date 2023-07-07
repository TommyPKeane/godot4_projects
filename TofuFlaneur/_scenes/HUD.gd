extends CanvasLayer

## Heads-up Display GDScript Module
##
## @tutorial(Documentation): https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html
## @tutorial(2D Game): 

signal start_game


func update_score(score):
	# $ScoreLabel.text = str(score)
	print(score)
	return


func _on_StartButton_pressed():
	$StartButton.hide()
	start_game.emit()
	return

# Called when the node enters the scene tree for the first time.
func _ready():
	$StartButton.show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	"""delta"""
	pass

func show_game_over(score):
	print("Game Over")
	print(score)
	return
