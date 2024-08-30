extends CharacterBody2D

const HORIZONTAL_SPEED = 150.0
const JUMP_VELOCITY = -200.0

@onready var sprite = $Sprite2D
@onready var animation = $AnimationPlayer
@onready var win_altar = $"../WinAltar"

var end = 0

func _physics_process(delta: float) -> void:
	handle_movement(delta)
	if end == 1:
		queue_free()
	move_and_slide()

func handle_movement(delta: float) -> void:
	handle_gravity(delta)
	handle_jump()
	handle_horizontal_movement()

func handle_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

func handle_jump() -> void:
	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func handle_horizontal_movement() -> void:
	var dirX := Input.get_axis("move_left", "move_right")
	if dirX:
		if Input.is_action_pressed("move_right"):
			sprite.flip_h = true
		else:
			sprite.flip_h = false
		animation.play("walk")
		velocity.x = dirX * HORIZONTAL_SPEED
		velocity.normalized()
	else:
		animation.play("idle")
		velocity.x = move_toward(velocity.x, 0, HORIZONTAL_SPEED*0.2)
