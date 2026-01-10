extends Area2D

@export var imagen_derecha : Texture2D
@export var imagen_izquierda : Texture2D

var palanca_activa = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		palanca_activa = !palanca_activa  

	if palanca_activa:
		$Sprite2D.texture = imagen_derecha  
	else:
		$Sprite2D.texture = imagen_izquierda
