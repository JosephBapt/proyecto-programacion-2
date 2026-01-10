extends Node2D

@onready var button1 = $Button/button
@onready var button2 = $Button2/button
@onready var platform1 = $PlatformUDJ/PathFollow2D
@onready var platform2 = $PlatformUDJ2/PathFollow2D
@onready var platform3 = $PlatformUDJ3/PathFollow2D

func _ready() -> void:
	button1.connect("on_state_changed", Callable(self, "move_same_time"))
	button2.connect("on_state_changed", Callable(self, "move_one"))

func move_same_time(state: bool) -> void:
	platform1.move = state
	platform1.button = state
	platform2.move = state
	platform2.button = state

func move_one(state: bool) -> void:
	platform3.move = state
	platform3.button = state
