extends CollisionShape2D

var UltimoProton

func _process(_delta):
	
	if UltimoProton == get_parent().Protones:
		return
	
	UltimoProton = get_parent().Protones
	
	CambiarRadio()

func CambiarRadio():
	shape.radius = get_parent().Protones*0.75
