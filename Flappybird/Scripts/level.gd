extends Node2D

@onready var score_label := $ScoreTracker/ScoreLabel
@onready var point_marker = preload("res://Scenes/point_marker.tscn").instantiate()

var score := 0


func _ready() -> void:
	score_label.text = "Score: {score}".format({"score": score}).pad_zeros(3)
	ScoreKeeper.add_score.connect(_add_score, score)

func _add_score() -> void:
		score += 1
		score_label.text = "Score: {pts}".format({"pts": score}).pad_zeros(3)
