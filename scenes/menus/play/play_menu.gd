extends Control

@onready var _save: SaveGame
var last_level: int

func _ready() -> void:
	$PanelContainer/VBoxContainer/Continue.grab_focus()
	_save = SaveGame.loadGame()
	last_level = _save.curr_level
	if  last_level == 10 or last_level == 9:
		last_level += -1

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down"):
		play_sound()

func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/maps/map" + str(last_level + 1) + "/map" + str(last_level + 1) + ".tscn")


func _on_select_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/levelSelector/level_selector.tscn")


func _on_go_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main/main_menu.tscn")

func play_sound() -> void:
	$AudioStreamPlayer.play()
