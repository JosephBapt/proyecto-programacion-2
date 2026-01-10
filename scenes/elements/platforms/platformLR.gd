extends AnimatableBody2D

@onready var animation = $AnimationPlayer

func _ready() -> void:
	animation.play("Left-Right")

func _process(delta: float) -> void:
	global_position = get_parent().global_position

func speed(animation_speed: float) -> void:
	animation.speed_scale = animation_speed
