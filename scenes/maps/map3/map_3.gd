extends Node2D

@onready var button1 = $Button/button
@onready var platform = $PlatformUDJ/PathFollow2D

func _ready() -> void:
	button1.connect("on_state_changed", Callable(self, "move"))

func move(state: bool) -> void:
	platform.move = state
	platform.button = state
