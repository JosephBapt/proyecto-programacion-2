extends Control

func _ready() -> void:
	$PanelContainer/VBoxContainer/StartButton.grab_focus()
	var _save: SaveGame = SaveGame.loadGame()
	if _save == null:
		_save = SaveGame.new()
		_save.curr_level = 0
		_save.scores = []
		_save.writeGame()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down"):
		play_sound()


# Start button

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/play/play_menu.tscn")

# Quit button
func _on_quit_button_pressed() -> void:
	get_tree().quit()

func play_sound() -> void:
	$AudioStreamPlayer.play()
