extends CanvasLayer

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func update_ui(score: int) -> void:
	$Label.text = "Score: " + str(score)
