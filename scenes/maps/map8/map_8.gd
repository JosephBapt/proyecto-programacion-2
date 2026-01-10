extends Node2D

@onready var button1 = $Button/button
@onready var button2 = $Button2/button
@onready var platform1 = $PlatformLR/PathFollow2D/AnimatableBody2D
@onready var platform2 = $PlatformLR2/PathFollow2D/AnimatableBody2D
@onready var platform3 = $PlatformUDJ/PathFollow2D

func _ready() -> void:
	button1.connect("on_state_changed", Callable(self, "move"))
	button2.connect("on_state_changed", Callable(self, "move"))
	platform1.speed(1.5)
	platform2.speed(1.5)

func move(state: bool) -> void:
	platform3.move = state
	platform3.button = state
