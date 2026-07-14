extends Label

var Minutos = 0
var Segundos = 0

func _process(delta):
	
	Segundos += delta
	
	if Segundos >= 60:
		Minutos += 1
		Segundos = 0
	
	if Segundos < 10:
		text = str(Minutos) + ":" + "0" + str(int(Segundos))
		return
	
	text = str(Minutos) + ":" + str(int(Segundos))
