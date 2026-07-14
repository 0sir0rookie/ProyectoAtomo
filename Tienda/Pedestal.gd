extends Node2D

@export var Objeto : PackedScene
@export var NodoPrecio : Node2D 
@export var labelPrecio : Label
@export var Colision : CollisionShape2D
@export var CuadroTexto : PanelContainer

var ultimoObjeto

var ObjIns

func _ready():
	
	CrearObjeto()
	ultimoObjeto = Objeto
	
	CuadroTexto.Posicion = Vector2(0,-30)
	CuadroTexto.PonerTexto(ObjIns.Texto)

func _process(_delta):
	
	if ultimoObjeto != Objeto:
		CrearObjeto()
		ultimoObjeto = Objeto
		DesOcultarDatos()

func CrearObjeto():
	ObjIns = Objeto.instantiate()
	
	labelPrecio.text = str(ObjIns.Precio)
	ObjIns.position.y -= 18
	
	add_child(ObjIns)

func OcultarDatos():
	NodoPrecio.visible = false
	ObjIns.queue_free()
	Colision.set_deferred("disabled",true)

func DesOcultarDatos():
	NodoPrecio.visible = true
	Colision.set_deferred("disabled",false)

func JugadorCompra(body : Jugador):
	
	if body.Electrones >= ObjIns.Precio:
		body.Electrones -= ObjIns.Precio
		
		if ObjIns.Arma:
			body.Armas.append(ObjIns.Escena)
		else:
			body.Objetos.append(ObjIns.Escena)
		
		OcultarDatos()
		
