extends Area2D

signal on_state_changed(state: bool)

@onready var isPressed = false
@onready var sprite = $Sprite2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("players") or body.is_in_group("push"):
		sprite.frame = 1
		isPressed = true
		$"../AudioStreamPlayer".playing = true
		emit_signal("on_state_changed", true)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("players") or body.is_in_group("push"):
		sprite.frame = 0
		isPressed = false
		emit_signal("on_state_changed", false)
