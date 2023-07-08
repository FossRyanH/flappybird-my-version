extends Control

@onready var replay_button := $PanelContainer/VBoxContainer/Button


func _ready() -> void:
	replay_button.button_down.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	ScoreKeeper.play_again.emit()
