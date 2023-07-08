extends Area2D


func _ready() -> void:
	connect("body_entered", _delete_pipes)
	area_entered.connect(_delete_point_marker)

func _delete_pipes(body: Node):
	if body.is_in_group("Pipe"):
		body.queue_free()

func _delete_point_marker(area : Node) -> void:
	if area.is_in_group("Points"):
		area.queue_free()
