extends AnimatableBody2D

@onready var animation = $AnimationPlayer
@onready var isUp = false

func _process(delta: float) -> void:
	global_position = get_parent().global_position

func _ready() -> void:
	animation.play("idle")

func _change_state(state: bool) -> void:
	isUp = state
	if isUp:
		animation.play("up")
	else:
		animation.play_backwards("up")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if not isUp and anim_name == "up":
		animation.play("idle")
