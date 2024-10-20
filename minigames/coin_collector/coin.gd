extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if not body.scale.x >= 4:
		body.scale.x += 0.05
		body.scale.y += 0.05
	queue_free()
