extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$UserStartPosition.position = Vector2(
		128,
		get_viewport().size.y - 128,
	)
	return


func start():
	show()
	$Tofu.initialize($UserStartPosition.position)
	return

# Called every frame
#
# Args:
# 	delta (float): Elapsed time [sec] since the previous frame
func _process(delta):
	return
