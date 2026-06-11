extends AtomoBase
class_name AtomoArea

func JugadorEnArea(body):
	
	if body is Jugador:
		body.HacerseDaño(Daño)
