extends CharacterBody2D

@export var Daño : float = 0
@export var TiempoVida = 0
@export var Animaciones : AnimationPlayer
@export var colision : CollisionShape2D

var Tiempo = 0

func _process(delta):
	
	SumarTiempo(delta)
	
	if Tiempo > TiempoVida:
		Morirse()
	move_and_slide()

func SumarTiempo(delta):
	Tiempo += delta

func Morirse():
	velocity = Vector2(0,0)
	colision.set_deferred("disabled", true)
	Animaciones.play("Destruccion")
