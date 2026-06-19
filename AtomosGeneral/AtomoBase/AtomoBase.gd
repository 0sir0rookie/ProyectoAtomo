extends CharacterBody2D
class_name AtomoBase

@export var Velocidad = 0
@export var Objetivo : CharacterBody2D
@export var AnimacionAtaque : AnimationPlayer

@export var Protones  = 0
@export var Neutrones = 0
@export var Electrones = Protones

@export var Estabilidad = 100
@export var Daño = 0

@export var AtomosDejar : Array[PackedScene]

var JugadorInArea : bool = false

func _process(_delta):
	
	if Estabilidad <= 0:
		Morirse()
	
	if JugadorInArea:
		AnimacionAtaque.play("Atacar")
	
	velocity = global_position.direction_to(Objetivo.position) * Velocidad
	move_and_slide()

func HacerseDaño(cantidad : float):
	Estabilidad -= cantidad 

func ActualizarColision(colision : CollisionShape2D):
	colision.set_deferred("disabled", true)
	colision.set_deferred("disabled", false)

func Morirse():
	
	for atomo in AtomosDejar:
		var atomoIns = atomo.instantiate()
		atomoIns.position = position
		atomoIns.Objetivo = Objetivo
		add_child(atomoIns)
	
	queue_free()


func DetectaJugador(body):
	if body is Jugador:
		JugadorInArea = true


func SalioJugador(body):
	if body is Jugador:
		JugadorInArea = false


func DañoDetectado(body):
	if "Daño" in body:
		HacerseDaño(body.Daño)
		body.queue_free()
	ActualizarColision($"DetectarDaño/CollisionShape2D")
