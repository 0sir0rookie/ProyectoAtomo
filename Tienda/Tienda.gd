extends Node2D

@export var Pedestal : PackedScene
@export var CantidadPedestales : float = 3
@export var SeparacionPedestal : float = 100

@export var Objetos : Array[PackedScene]

func _ready() -> void:
	
	var distanciaTotal : float = SeparacionPedestal*(CantidadPedestales - 1)
	
	for pedestal in range(CantidadPedestales):
		var PedeIns = Pedestal.instantiate()
		PedeIns.position = Vector2((100 * pedestal) - (distanciaTotal/2),0)
		PedeIns.Objeto = Objetos[0]
		
		add_child(PedeIns)
		
