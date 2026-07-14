extends Label

var ultimoPro = -1

func _process(_delta):
	
	if ultimoPro != InfoJu.Protones:
		text = str(InfoJu.Protones)
		ultimoPro = InfoJu.Protones
