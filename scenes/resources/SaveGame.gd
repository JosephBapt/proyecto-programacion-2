class_name SaveGame
extends Resource

const SAVE_PATH := "user://savegame.tres"

@export var curr_level := 0
@export var scores := []

func writeGame() -> void:
	ResourceSaver.save(self, SAVE_PATH)

static func loadGame() -> Resource:
	if ResourceLoader.exists(SAVE_PATH):
		return load(SAVE_PATH)
	return null
