extends CharacterBody2D

@export var Sumatoria : int = 0

@export var Dialogos : Array[String]
@export var CuadroTexto : PanelContainer

var cooldown = 5
var Tiempo = 0

func _ready():
	
	TextoRandom()
	CuadroTexto.Posicion = Vector2(0,-Sumatoria)
	
	randomize()

func _process(delta):
	
	Tiempo += delta
	
	if Tiempo > cooldown:
		Tiempo = 0
		TextoRandom()

func TextoRandom():
	CuadroTexto.PonerTexto(Dialogos[randi() % Dialogos.size()])
