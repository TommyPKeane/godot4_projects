extends Node2D

var selected_level_scene: PackedScene

func on_level_00_select_pressed():
	selected_level_scene = load("res://levels/Level00.tscn")
	hide()
	get_tree().root.add_child(selected_level_scene.instantiate())
	return

# Called when the node enters the scene tree for the first time.
func _ready():
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	return
