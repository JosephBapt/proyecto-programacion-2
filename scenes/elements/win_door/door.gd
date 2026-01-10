extends Area2D

var count = 0

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		count += 1
		if count == 2:
			$"../../Menus/WinMenu".win()


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("players"):
		count -= 1 
