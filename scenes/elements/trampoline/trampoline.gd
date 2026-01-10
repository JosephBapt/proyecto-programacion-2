extends Area2D

var bounce_velocity = Vector2(0, -400)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		body.velocity = bounce_velocity
