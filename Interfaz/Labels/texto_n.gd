extends Label

var ultimoNeu = -1

func _process(_delta):
	
	if ultimoNeu != InfoJu.Neutrones:
		text = str(InfoJu.Neutrones)
		ultimoNeu = InfoJu.Neutrones
