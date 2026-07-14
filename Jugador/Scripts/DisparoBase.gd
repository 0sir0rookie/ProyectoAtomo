extends Node2D

@export var cooldown : float = 0
@export var velocidad : float = 0
@export var potenciadorDaño : float = 0
@export var proyectil : PackedScene

signal disparar(posicion : Vector2)

var Tiempo = 0
var PosicionMouse

func _ready():
	
	disparar.connect(self.Disparar)
	

func _process(delta):
	
	Tiempo += delta
	PosicionMouse = get_global_mouse_position()
	

func Disparar(posicion : Vector2):
	
	if Tiempo < cooldown:
		return
	else:
		Tiempo = 0
	
	var proyectilIns : CharacterBody2D = proyectil.instantiate()
	
	proyectilIns.rotation = atan2((PosicionMouse.y - posicion.y),PosicionMouse.x - posicion.x)
	proyectilIns.velocity = Vector2(1,0).rotated(atan2((PosicionMouse.y - posicion.y),PosicionMouse.x - posicion.x)) * velocidad
	proyectilIns.position = posicion
	
	proyectilIns.Daño = ((potenciadorDaño + 100)*proyectilIns.Daño)/100
	
	get_parent().get_parent().add_child(proyectilIns)
	
