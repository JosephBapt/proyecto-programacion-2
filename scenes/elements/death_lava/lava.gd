extends Node2D

@onready var animation = $Area2D/AnimationPlayer

func _ready() -> void:
	animation.play("lava")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		get_tree().reload_current_scene()
