extends Node2D
@onready var button1 = $Button/button
@onready var button2 = $Button2/button
@onready var platform1 = $PlatformUDJ/PathFollow2D
@onready var platform2 = $PlatformUDJ2/PathFollow2D

func _ready() -> void:
	button1.connect("on_state_changed", Callable(self, "move"))
	button2.connect("on_state_changed", Callable(self, "move_one"))

func move(state: bool) -> void:
	platform1.move = state
	platform1.button = state

func move_one(state: bool) -> void:
	platform2.move = true
	platform2.button = true	
