extends RigidBody2D
class_name Player

@export var jump_force := 425.0

@onready var audio_player := $AudioStreamPlayer
@onready var death_area := $Area2D


func _ready() -> void:
	death_area.body_entered.connect(_on_collision)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		apply_central_impulse(Vector2.UP * jump_force)
		audio_player.play()
		await  audio_player.finished

func _on_collision(body) -> void:
	if body is Player:
		return
	ScoreKeeper.player_died.emit()
