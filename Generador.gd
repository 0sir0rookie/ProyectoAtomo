extends Node2D

@export var AtomoBase : PackedScene
@export var jugador : CharacterBody2D

@export var Cooldown = 0

var Tiempo = 0

func _process(delta):
	
	Tiempo += delta
	
	if Tiempo > Cooldown:
		
		Tiempo = 0
		
		var AtomoIns = AtomoBase.instantiate()
		
		AtomoIns.Protones = randi_range(1,118)
		AtomoIns.Objetivo = jugador
		AtomoIns.position = PosicionAleatoria()
		
		add_child(AtomoIns)

func PosicionAleatoria():
	
	
	match randi_range(1,4):
		1:
			return AleX(jugador.position.x + 600,jugador.position.x - 600,jugador.position.y + 424)
		2:
			return AleX(jugador.position.x + 600,jugador.position.x - 600,jugador.position.y - 424)
		3:
			return AleX(jugador.position.y + 450,jugador.position.y - 450,jugador.position.x + 676)
		4:
			return AleX(jugador.position.y + 450,jugador.position.y - 450,jugador.position.x - 676)
	

func AleX(xpositivo,xnegativo,y):
	
	return Vector2(randi_range(xnegativo,xpositivo),y)
	

func AleY(ypositivo,ynegativo,x):
	
	return Vector2(x,randi_range(ynegativo,ypositivo))
	
	
