extends CharacterBody2D

@export var Sumatoria : int = 0

@export var Dialogos : Array[String]
@export var CuadroTexto : PanelContainer

var cooldown = 5
var Tiempo = 0

func _ready():
	
	TextoRandom()
	SetPosicionTexto(Vector2(0,-Sumatoria))
	
	randomize()

func _process(delta):
	
	SumarTiempo(delta)
	
	if Tiempo > cooldown:
		ReiniciarTiempo()
		TextoRandom()

func ReiniciarTiempo():
	Tiempo = 0

func SumarTiempo(delta):
	Tiempo += delta

func SetPosicionTexto(posicion):
	CuadroTexto.Posicion = posicion

func TextoRandom():
	CuadroTexto.PonerTexto(Dialogos[randi() % Dialogos.size()])
