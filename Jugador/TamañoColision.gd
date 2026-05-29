extends CollisionShape2D

var UltimoProton

func _ready():
	
	if get_parent().Protones > 50:
		CambiarRadio()
	
	UltimoProton = get_parent().Protones

func _process(_delta):
	
	if UltimoProton == get_parent().Protones or get_parent().Protones < 50:
		return
	
	UltimoProton = get_parent().Protones
	
	CambiarRadio()

func CambiarRadio():
	shape.radius = get_parent().Protones/2
	
