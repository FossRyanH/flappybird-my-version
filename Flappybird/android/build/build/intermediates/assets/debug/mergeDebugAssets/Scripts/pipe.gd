extends CharacterBody2D

var speed := 75.0

func _physics_process(delta: float) -> void:
	position.x -= speed * delta
