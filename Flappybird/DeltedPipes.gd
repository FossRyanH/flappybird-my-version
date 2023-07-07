extends Area2D


func _ready() -> void:
	connect("body_entered", _delete_pipes)

func _delete_pipes(body: Node):
	if body.is_in_group("Pipe"):
		body.queue_free()
