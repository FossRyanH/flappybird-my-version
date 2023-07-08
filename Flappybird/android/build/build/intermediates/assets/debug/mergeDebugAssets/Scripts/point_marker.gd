extends Area2D
class_name PointsUp

var speed := 75.0


func _ready() -> void:
	body_exited.connect(score_up)

func _physics_process(delta: float) -> void:
	position.x -= speed * delta

func score_up(body : Node) -> void:
	if body is RigidBody2D:
		ScoreKeeper.add_score.emit()
