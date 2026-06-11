extends Node2D

@export var VelocidadBala = 50 
@export var TiempoVida = 20
@export var Daño : float = 0

@export var Bala : PackedScene

var PosicionMouse
var Tiempo = 0 

func _ready():
	
	PosicionMouse = get_global_mouse_position()
	
	var BalaIns = Bala.instantiate()
	
	BalaIns.velocity = global_position.direction_to(PosicionMouse) * VelocidadBala
	BalaIns.Daño = Daño
	
	add_child(BalaIns)

func _process(delta):
	
	Tiempo += delta
	
	if Tiempo > TiempoVida:
		queue_free()
