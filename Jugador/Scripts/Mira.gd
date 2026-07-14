extends Node2D

@export var PosicionMouse : Vector2

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(_delta):
	
	PosicionMouse =  get_global_mouse_position()
	
	position =  PosicionMouse
