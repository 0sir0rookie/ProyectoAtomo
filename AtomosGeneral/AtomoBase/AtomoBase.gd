extends CharacterBody2D
class_name AtomoBase

@export var Velocidad = 0
@export var AnimacionAtaque : AnimationPlayer

@export var Fuerza : Array[Vector2]
@export var ValorTiempo : Array[float]

@export var Protones  = 0
@export var Neutrones = 0
@export var Electrones = Protones

@export var Estabilidad = 100
@export var Daño = 0

@export var AtomosDejar : Array[PackedScene]
@export var CantidadDejar = 0

@export var ElectronDejar : PackedScene

var JugadorInArea : bool = false
var TiempoFuerzas : Array[float]

func _process(delta):
	
	if Estabilidad <= 0:
		Morirse()
	
	if JugadorInArea:
		AnimacionAtaque.play("Atacar")
	
	velocity = (global_position.direction_to(InfoJu.posicion) * Velocidad) + GenerarFuerzas(delta)
	move_and_slide()

func GenerarFuerzas(delta):
	if Fuerza.size() != ValorTiempo.size():
		print("Error: Diferente cantidad tiempo-fuerza")
		return
	
	var VectorF : Vector2 = Vector2(0,0)
	
	for i in range(Fuerza.size()):
		
		if  0 <= i and i <= (TiempoFuerzas.size() - 1):
			TiempoFuerzas[i] += delta
		else:
			TiempoFuerzas.append(delta)
		
		if (ValorTiempo[i] / (TiempoFuerzas[i] + 0.01)) < 1:
			Fuerza.pop_at(i)
			ValorTiempo.pop_at(i)
			break
		VectorF += Fuerza[i] * (ValorTiempo[i] / (TiempoFuerzas[i] + 0.01))
	
	return VectorF

func HacerseDaño(cantidad : float):
	Estabilidad -= cantidad 

func ActualizarColision(colision : CollisionShape2D):
	colision.set_deferred("disabled", true)
	colision.set_deferred("disabled", false)

func Morirse():
	
	var NAngulos = 0
	
	if AtomosDejar.size() > 0:
		NAngulos = 360.0 / AtomosDejar.size()
	
	for n in range(AtomosDejar.size()):
		var atomoIns : AtomoBase = AtomosDejar[n].instantiate()
		atomoIns.position = position
		atomoIns.Fuerza.append(Vector2(1,0).rotated(deg_to_rad((n + 1) * NAngulos)))
		atomoIns.ValorTiempo.append(10)
		get_parent().add_child(atomoIns)
	
	for i in range(1,CantidadDejar + 1):
		
		var electronIns = ElectronDejar.instantiate()
		electronIns.position = position
		electronIns.Angulo = (360.0/CantidadDejar) * i
		
		get_parent().add_child(electronIns)
	
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
		body.Morirse()
	ActualizarColision($"DetectarDaño/CollisionShape2D")
