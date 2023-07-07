extends Node

@export var mob_scene: PackedScene
@export var ScoreType: UserScore

enum UserScore {
	AVOIDED,
	BOTHERED,
	CALMED,
	CONFUSED,
	CONVERTED,
	KILLED,
}

var user_score: Dictionary

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

func game_over():
	$HUD.show_game_over(user_score)
	# $Music.stop()
	# $DeathSound.play()

func new_game():
	_reset_user_score()
	$HUD.update_score(user_score)
	$Tofu.initialize($UserStartPosition.position)
	# $Music.play()
