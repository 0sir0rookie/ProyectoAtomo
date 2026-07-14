extends Node2D

@export var Atomos : PackedScene

@export var Cooldown = 0

@export var Desactivar : bool = false

var Tiempo = 0

func _process(delta):
	
	if Desactivar:
		return
	
	Tiempo += delta
	
	if Tiempo > Cooldown:
		
		Tiempo = 0
		
		var AtomoIns = Atomos.instantiate()
		
		AtomoIns.position = PosicionAleatoria()
		
		get_parent().add_child(AtomoIns)

func PosicionAleatoria():
	
	
	match randi_range(1,4):
		1:
			return AleX(InfoJu.posicion.x + 600,InfoJu.posicion.x - 600,InfoJu.posicion.y + 424)
		2:
			return AleX(InfoJu.posicion.x + 600,InfoJu.posicion.x - 600,InfoJu.posicion.y - 424)
		3:
			return AleX(InfoJu.posicion.y + 450,InfoJu.posicion.y - 450,InfoJu.posicion.x + 676)
		4:
			return AleX(InfoJu.posicion.y + 450,InfoJu.posicion.y - 450,InfoJu.posicion.x - 676)
	

func AleX(xpositivo,xnegativo,y):
	
	return Vector2(randi_range(xnegativo,xpositivo),y)
	

func AleY(ypositivo,ynegativo,x):
	
	return Vector2(x,randi_range(ynegativo,ypositivo))
	
	
