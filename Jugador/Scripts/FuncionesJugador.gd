extends CharacterBody2D
class_name Jugador

@export var Armas : Array[PackedScene]
@export var Objetos : Array[PackedScene]

@export var ArmaEscojida = 0

@export var Velocidad = 0

@export var Neutrones = 0
@export var Protones = 0
@export var Electrones = 0

@export var Estabilidad = 100
@export var Daño : float = 0

var ArmaActual = null

func _physics_process(_delta):
	
	if ArmaActual == null:
		CrearArma()
	
	if Estabilidad <= 0:
		queue_free() 
	
	Moverse()
	EnviarInformacion()
	
	if Input.is_action_just_pressed("Click"):
		ArmaActual.disparar.emit(position)
	
	if Input.is_action_just_pressed("RatonArriba") and Armas.size() > ArmaEscojida:
		CambiarDeArma("Arriba")
		EliminarArma()
	
	if Input.is_action_just_pressed("RatonAbajo") and (Armas.size() < ArmaEscojida and ArmaEscojida > 0):
		CambiarDeArma("Abajo")
		EliminarArma()
	
	move_and_slide()

func EnviarInformacion():
	InfoJu.Electrones = Electrones
	InfoJu.Neutrones = Neutrones
	InfoJu.Protones = Protones
	InfoJu.posicion = position

func CrearArma():
	
	ArmaActual = Armas[ArmaEscojida].instantiate()
	ArmaActual.potenciadorDaño = Daño
	add_child(ArmaActual)

func EliminarArma():
	
	ArmaActual.queue_free()
	ArmaActual = null

func CambiarDeArma(Polo : String):
	
	if Polo == "arriba":
		ArmaEscojida += 1
		
	if Polo == "Abajo":
		ArmaEscojida -= 1
	

func Moverse():
	if Input.is_action_pressed("Izquierda"):
		velocity.x = -Velocidad
	elif Input.is_action_pressed("Derecha"):
		velocity.x = Velocidad
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("Arriba"):
		velocity.y = -Velocidad
	elif Input.is_action_pressed("Abajo"):
		velocity.y = Velocidad
	else:
		velocity.y = 0

func HacerseDaño(cantidad : float):
	Estabilidad -= cantidad
