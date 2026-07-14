extends Node2D

func _process(delta):
	
	if 
	
	if InfoJuego.OleadaInProgreso:
		SumarTiempo(delta) 

func CalcularTiempo():
	InfoJuego.TNextOleada = 60 * ((2 + InfoJuego.Oleada)/3)

func SumarTiempo(delta):
	InfoJuego.Tiempo += delta
