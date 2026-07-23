extends Node

var score: int = 0

func increase_score(points: int) -> void:
	score += points
	$"../Hud".update_ui(score)
