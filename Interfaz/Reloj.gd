extends Label

@export var Pausar : bool = false

var Minutos = 0
var Segundos = 0

func _process(delta):
	
	if Pausar:
		return
	
	Segundos += delta
	
	if Segundos >= 60:
		Minutos += 1
		Segundos = 0
	
	if Segundos < 10:
		text = str(Minutos) + ":" + "0" + str(int(Segundos))
		return
	
	text = str(Minutos) + ":" + str(int(Segundos))

func ReiniciarReloj():
	Minutos = 0
	Segundos = 0
