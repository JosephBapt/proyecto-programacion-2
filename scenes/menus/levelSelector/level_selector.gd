extends Control

@onready var _save: SaveGame
@onready var levelContainer = $PanelContainer2/VBoxContainer

func _ready() -> void:
	_save = SaveGame.loadGame()
	for n in _save.curr_level + 1:
		levelContainer.get_child(n).disabled = false
		if n < _save.curr_level:
			levelContainer.get_child(n).text = "             Nivel" + str(n+1)
			levelContainer.get_child(n).icon = load("res://assets/estrellas"+str(_save.scores[n])+"-2.png")
			levelContainer.get_child(n).icon_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		levelContainer.get_child(n).focus_mode = FocusMode.FOCUS_ALL
	levelContainer.get_child(0).grab_focus()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down"):
		play_sound()

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/maps/map1/map1.tscn")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/maps/map2/map2.tscn")

func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/maps/map3/map3.tscn")

func _on_level_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/maps/map4/map4.tscn")

func _on_level_5_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/maps/map5/map5.tscn")

func _on_level_6_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/maps/map6/map6.tscn")

func _on_level_7_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/maps/map7/map7.tscn")

func _on_level_8_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/maps/map8/map8.tscn")

func _on_level_9_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/maps/map9/map9.tscn")

func play_sound() -> void:
	$AudioStreamPlayer.play()
