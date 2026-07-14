extends PanelContainer

@export var Posicion : Vector2 = Vector2(0,0)
@export var Animaciones : AnimationPlayer
@export var label : Label
@export var Colision : CollisionShape2D

var UltimaPosicion : Vector2 = Vector2(0,0)

var EstaCerca : bool = false

func _ready():
	modulate.a = 0

func _process(_delta):
	
	corregirPosiciones()

func corregirPosiciones():
	
	position = Posicion
	
	if UltimaPosicion != position:
		position.x -= size.x/2
		position.y -= size.y + 8
		
		Colision.position = size/2 + Vector2(0,40)
		
		UltimaPosicion = position
	

func PonerTexto(texto : String):
	size = Vector2(22,22)
	label.text = texto

func Aparecer():
	Animaciones.play("Aparecer")

func Desaparecer():
	Animaciones.play("Desaparecer")

func JugadorCerca(_body):
	Aparecer()
	
func JugadorSalio(_body):
	Desaparecer()
