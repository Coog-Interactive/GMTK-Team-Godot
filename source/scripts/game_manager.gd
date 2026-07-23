extends Node

var score: int = 0

# Testing
func _ready() -> void:
	$Timer.start()

func increase_score(points: int) -> void:
	score += points

func _process(delta: float) -> void:
	$"../Hud".update_ui(score, $Timer.time_left)
