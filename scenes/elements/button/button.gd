extends Area2D

@onready var isPressed = false
@onready var sprite = $Sprite2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		sprite.frame = 1
		isPressed = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("players"):
		sprite.frame = 0
		isPressed = false
