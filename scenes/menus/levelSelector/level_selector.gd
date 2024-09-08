extends Control

@onready var _save: SaveGame
@onready var levelContainer = $PanelContainer2/VBoxContainer

func _ready() -> void:
	_save = SaveGame.loadGame()
	if _save == null:
		_save = SaveGame.new()
		_save.curr_level = 0
		_save.scores = []
		_save.writeGame()
	for n in _save.curr_level + 1:
		levelContainer.get_child(n).disabled = false
	levelContainer.get_child(0).grab_focus()


func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/maps/map1/map1.tscn")


func _on_level_2_pressed() -> void:
	pass # Replace with function body.
