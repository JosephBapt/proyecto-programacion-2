extends PathFollow2D

const max_velocity = 2
var direction = 1
var velocity = max_velocity

func _physics_process(delta: float) -> void:
	progress += velocity * direction
	if progress_ratio >= 1 or progress_ratio <= 0:
		direction *= -1
