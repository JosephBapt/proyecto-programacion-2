extends CharacterBody2D

var HORIZONTAL_SPEED = 100.0
const JUMP_VELOCITY = -200.0
var end = false

@onready var sprite = $Sprite2D
@onready var animation = $AnimationPlayer
@export var controls: Resource = null

func _physics_process(delta: float) -> void:
	handle_movement(delta)
	if end:
		get_tree().change_scene_to_file("res://scenes/menus/main/main_menu.tscn")
	move_and_slide()

func handle_movement(delta: float) -> void:
	handle_gravity(delta)
	handle_jump()
	handle_horizontal_movement()

func handle_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

func handle_jump() -> void:
	if Input.is_action_just_pressed(controls.move_jump) and is_on_floor():
		velocity.y = JUMP_VELOCITY

func handle_horizontal_movement() -> void:
	var dirX := Input.get_axis(controls.move_left, controls.move_right)
	if dirX:
		if Input.is_action_pressed(controls.move_right):
			sprite.flip_h = true
		else:
			sprite.flip_h = false
		animation.play("walk")
		velocity.x = dirX * HORIZONTAL_SPEED
		velocity.normalized()
	else:
		animation.play("idle")
		velocity.x = move_toward(velocity.x, 0, HORIZONTAL_SPEED*0.2)
