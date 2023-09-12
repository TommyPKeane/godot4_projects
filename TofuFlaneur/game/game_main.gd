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
	
#	$ItemCashew.position = $UserStartPosition.position + Vector2(128 + 256, 32)
#	$ItemCashew.show()
#	$ItemCashew.apply_scale(Vector2(4, 4))
#	$ItemCashew.get_child(1).play()
#
#	$ItemAcorn.position = $UserStartPosition.position + Vector2(128 + 512, 32)
#	$ItemAcorn.show()
#	$ItemAcorn.apply_scale(Vector2(4, 4))
#	$ItemAcorn.get_child(1).play()
#
#	$ItemAlmond.position = $UserStartPosition.position + Vector2(128 + 768, 32)
#	$ItemAlmond.show()
#	$ItemAlmond.apply_scale(Vector2(4, 4))
#	$ItemAlmond.get_child(1).play()
	return

# Called every frame
#
# Args:
# 	delta (float): Elapsed time [sec] since the previous frame
func _process(delta):
	return
