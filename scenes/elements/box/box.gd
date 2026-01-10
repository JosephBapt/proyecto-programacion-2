extends CharacterBody2D 

@export var velocidad_empuje = 110.0 
var push = false
var right = false
var left = false
var friction = 0.9

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if push:
		if Input.is_action_pressed("move_right") and right:
			velocity.x = velocidad_empuje
		elif Input.is_action_pressed("move_left") and left:
			velocity.x = -velocidad_empuje
		else:
			velocity.x *= friction 
	else:
		velocity.x *= friction  
	
	move_and_slide()


func _on_left_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		push = true
		left = true

func _on_left_body_exited(body: Node2D) -> void:
	if body.is_in_group("players"): 
		push = false
		left = false

func _on_right_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		push = true
		right = true

func _on_right_body_exited(body: Node2D) -> void:
	if body.is_in_group("players"): 
		push = false
		right = false
