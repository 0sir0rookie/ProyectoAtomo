extends Label

var ultimoElec = -1

func _process(_delta):
	
	if ultimoElec != InfoJu.Electrones:
		text = str(InfoJu.Electrones)
		ultimoElec = InfoJu.Electrones
