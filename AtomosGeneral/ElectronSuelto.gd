extends CharacterBody2D

@export var Angulo : float
@export var Duracion : float = 0

@export var Valor = 0

@export var velocidad = 0

var Tiempo = 0

func _process(delta):
	
	SumarTiempo(delta)
	
	if Tiempo < Duracion:
		EfectoSuelto()
	elif GetDistanciaJugador() < 50:
		SeguirJugador()
	else:
		PausarVelocidad()
	
	move_and_slide()

func GetDistanciaJugador():
	return sqrt(pow(InfoJu.posicion.x - position.x, 2) + pow(InfoJu.posicion.y - position.y, 2))

func EfectoSuelto():
	velocity = Vector2(1,0).rotated(rad_to_deg(Angulo)) * (Duracion / (Tiempo + 0.01))

func SeguirJugador():
	velocity = (global_position.direction_to(InfoJu.posicion) * velocidad)

func PausarVelocidad():
	velocity = Vector2(0,0)

func SumarTiempo(delta):
	Tiempo += delta


func Jugador_in_area(body: Node2D):
	
	body.Electrones += Valor
	queue_free()
