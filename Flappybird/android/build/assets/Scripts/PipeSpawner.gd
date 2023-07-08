extends Node2D

@export var min_pipe_height := 450
@export var max_pipe_height := 325

@export var top_pipe_min_height := -50
@export var top_pipe_max_height := -10

@onready var pipe_scene = preload("res://Scenes/pipe.tscn")
@onready var spawn_timer : Timer = Timer.new()
@onready var point_marker = preload("res://Scenes/point_marker.tscn")

func _ready() -> void:
	randomize()
	spawn_timer.wait_time = 1.25
	spawn_timer.timeout.connect(_spawn_pipe)
	add_child(spawn_timer)
	spawn_timer.start()

func _spawn_pipe() -> void:
	var bottom_pipe = pipe_scene.instantiate()
	var top_pipe = pipe_scene.instantiate()
	var offset_range = randi_range(50, 60)
	var the_points = point_marker.instantiate()
	the_points.position.y = 0.0
	bottom_pipe.position.y = randi_range(max_pipe_height, min_pipe_height)
	top_pipe.position.y = (bottom_pipe.get_node("ThePipe").texture.get_height() - 310) - offset_range
	add_child(bottom_pipe)
	add_child(top_pipe)
	add_child(the_points)
