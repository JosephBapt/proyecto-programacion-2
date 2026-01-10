extends Control

@export var curr_level: int
@onready var _save: SaveGame
@onready var input_events = InputMap.action_get_events("pause")
@onready var time = 0

func _ready():
	$AnimationPlayer.play("RESET")
	$PanelContainer/VBoxContainer/next_level.grab_focus()
	if curr_level == 9:
		$PanelContainer/VBoxContainer/next_level.disabled = true
		$PanelContainer/VBoxContainer/next_level.focus_mode = FocusMode.FOCUS_NONE
		$PanelContainer/VBoxContainer/go_main_menu.grab_focus()

func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down") )and get_tree().paused == true:
		play_sound()

func win():
	$Timer.stop()
	$PanelContainer/VBoxContainer/TextureRect.texture = load("res://assets/estrellas"+str(makeScore(time))+".png")
	pause()

func resume():
	get_tree().paused = false
	for input in input_events:
		InputMap.action_add_event("pause", input)
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused = true
	InputMap.action_erase_events("pause")
	$PanelContainer/VBoxContainer/next_level.grab_focus()
	$AnimationPlayer.play("blur")

func _on_next_level_pressed() -> void:
	resume()
	_save = SaveGame.loadGame()
	if _save.curr_level == curr_level - 1:
		_save.curr_level += 1
		_save.scores.push_back(makeScore(time))
		_save.writeGame()
	elif _save.scores[curr_level - 1] < makeScore(time):
		_save.scores[curr_level - 1] = makeScore(time)
	get_tree().change_scene_to_file("res://scenes/maps/map" + str(curr_level + 1) + "/map" + str(curr_level + 1) +  ".tscn")


func _on_go_main_menu_pressed() -> void:
	resume()
	_save = SaveGame.loadGame()
	if _save.curr_level == curr_level - 1:
		_save.curr_level += 1
		_save.scores.push_back(makeScore(time))
		_save.writeGame()
	elif _save.scores[curr_level - 1] < makeScore(time):
		_save.scores[curr_level - 1] = makeScore(time)
	get_tree().change_scene_to_file("res://scenes/menus/main/main_menu.tscn")


func _on_timer_timeout() -> void:
	time += 1

func makeScore(score) -> int:
	if score < 90:
		return 3
	elif score < 120:
		return 2
	elif score < 150:
		return 1
	else:
		return 0

func play_sound() -> void:
	$AudioStreamPlayer.play()
