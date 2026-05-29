extends CharacterBody2D
class_name Jugador

@export var Armas : Array[PackedScene]

@export var ArmaEscojida = 0

@export var Velocidad = 0

@export var Neutrones = 2
@export var Protones = 2
@export var Electrones = 2

func _physics_process(_delta):
	
	if Protones <= 0:
		queue_free() 
	
	Moverse()
	
	if Input.is_action_just_pressed("Click"):
		Disparar()
	
	move_and_slide()

func Disparar():
	
	var ArmaIns = Armas[ArmaEscojida].instantiate()
	ArmaIns.position = position
	get_parent().add_child(ArmaIns)

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
