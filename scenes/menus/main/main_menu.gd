extends Control

func _ready() -> void:
	$PanelContainer/VBoxContainer/StartButton.grab_focus()


# Start button

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/levelSelector/level_selector.tscn")

# Quit button
func _on_quit_button_pressed() -> void:
	get_tree().quit()
