extends RigidBody2D

@export var jump_force := 425.0


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		apply_central_impulse(Vector2.UP * jump_force)
