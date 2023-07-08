extends Node2D

@onready var anim := $AnimationPlayer
@onready var main_scene : PackedScene = load("res://Scenes/level.tscn")


func _ready() -> void:
	anim.play("blink")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene_to_packed(main_scene)
