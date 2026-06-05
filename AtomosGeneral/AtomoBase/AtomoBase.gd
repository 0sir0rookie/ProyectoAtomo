extends CharacterBody2D
class_name AtomoBase

@export var Velocidad = 0
@export var Objetivo : CharacterBody2D
@export var AnimacionAtaque : AnimationPlayer

@export var Protones  = 0
@export var Neutrones = 0
@export var Electrones = Protones

var JugadorInArea : bool = false

func _process(_delta):
	
	if JugadorInArea:
		AnimacionAtaque.play("Atacar")
	
	velocity = global_position.direction_to(Objetivo.position) * Velocidad
	move_and_slide()


func DetectaJugador(body):
	if body is Jugador:
		JugadorInArea = true


func SalioJugador(body):
	if body is Jugador:
		JugadorInArea = false
