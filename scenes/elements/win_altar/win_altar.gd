extends Node2D

@onready var main_character_blue = $"../main_character"
@onready var animation = $StaticBody2D/AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("2")
	if body.name == "main_character_blue" or body.name == "main_character_red" or body.name == "main_character":
		main_character_blue.end = 1



func _on_area_2d_area_entered(area: Area2D) -> void:
	print("1")
