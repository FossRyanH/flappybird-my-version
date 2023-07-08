extends Node2D

@onready var score_label := $ScoreTracker/ScoreLabel
@onready var point_marker = preload("res://Scenes/point_marker.tscn").instantiate()
@onready var player := $Player
@onready var game_over_screen := $ScoreTracker/GameOver

@onready var main_menu : PackedScene = load("res://Scenes/start_screen.tscn")

var score := 0


func _ready() -> void:
	score_label.text = "Score: {score}".format({"score": score}).pad_zeros(3)
	ScoreKeeper.add_score.connect(_add_score, score)
	ScoreKeeper.player_died.connect(_game_over)
	game_over_screen.visible = false
	ScoreKeeper.play_again.connect(_play_again)

func _add_score() -> void:
		score += 1
		score_label.text = "Score: {pts}".format({"pts": score}).pad_zeros(3)

func _game_over() -> void:
	player.set_physics_process(false)
	player.queue_free()
	game_over_screen.visible = true

func _play_again() -> void:
	get_tree().change_scene_to_packed(main_menu)
