extends Node

enum UserScore {
	AVOIDED,
	BOTHERED,
	CALMED,
	CONFUSED,
	CONVERTED,
	KILLED,
}

var user_score: Dictionary
var game_options: Dictionary

func _ready():
	$MainMenu.show()
	return

func _reset_user_score():
	user_score = {
		UserScore.AVOIDED: 0,
		UserScore.BOTHERED: 0,
		UserScore.CALMED: 0,
		UserScore.CONFUSED: 0,
		UserScore.CONVERTED: 0,
		UserScore.KILLED: 0,
	}
	return
	
func modify_user_score(score_type: UserScore, offset: int):
	user_score[score_type] += offset 
	return

func new_game():
	_reset_user_score()
	$"MainMenu".hide()
	$"2DGame".start()
	return

func game_over():
	return
	
func open_options_menu():
	$"MainMenu".hide()
	$"OptionsWindow".show()
	$"OptionsWindow".position = Vector2(get_viewport().size / 2) - Vector2($OptionsWindow.size / 2)
	var size_info = {
		"viewport": {
			"size": get_viewport().size,
			"position": get_viewport().position,
		},
		"options": {
			"size": $OptionsWindow.size,
			"position": $OptionsWindow.position,
		},
	}
	print(size_info)
	return

func close_options_menu():
	$OptionsWindow.hide()
	$MainMenu.show()
	return

func quit_game():
	get_tree().quit()
	return

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit() # default behavior
	else:
		pass
	return
