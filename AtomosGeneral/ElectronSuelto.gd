extends CharacterBody2D

@export var Angulo : float
@export var Duracion : float = 0

@export var Valor = 0

@export var velocidad = 0

var Tiempo = 0

func _process(delta):
	
	Tiempo += delta
	
	if Tiempo < Duracion:
		velocity = Vector2(1,0).rotated(rad_to_deg(Angulo)) * (Duracion / (Tiempo + 0.01))
	
	elif sqrt(pow(InfoJu.posicion.x - position.x, 2) + pow(InfoJu.posicion.y - position.y, 2)) < 50:
		velocity = (global_position.direction_to(InfoJu.posicion) * velocidad)
	else:
		velocity = Vector2(0,0)
	
	move_and_slide()


func Jugador_in_area(body: Node2D):
	
	body.Electrones += Valor
	queue_free()
