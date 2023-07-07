extends Node2D

@export var min_pipe_height := 350
@export var max_pipe_height := 550

@onready var pipe_scene = preload("res://pipe.tscn")
@onready var spawn_timer : Timer = Timer.new()

func _ready() -> void:
	randomize()
	spawn_timer.wait_time = 1.5
	spawn_timer.timeout.connect(_spawn_pipe)
	add_child(spawn_timer)
	spawn_timer.start()

func _spawn_pipe() -> void:
	var new_pipe = pipe_scene.instantiate()
	new_pipe.position.y = randi_range(min_pipe_height, max_pipe_height)
	add_child(new_pipe)
