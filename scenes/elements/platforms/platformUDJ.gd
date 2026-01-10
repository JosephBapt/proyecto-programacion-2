extends PathFollow2D

const max_velocity = 2

var direction = 1
var velocity = max_velocity
var move: bool = false
var touching: bool = false
var button: bool = false

func _physics_process(delta: float) -> void:
	if move:
		if progress_ratio < 1.0:
			progress += velocity * direction
		else:
			move = false
	elif button:
		pass
	elif progress_ratio != 0 and !touching:
		progress += max_velocity * -1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		velocity = 0
		touching = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("players"):
		velocity = max_velocity
		touching = false
