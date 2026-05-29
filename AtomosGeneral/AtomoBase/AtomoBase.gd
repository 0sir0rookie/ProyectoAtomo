extends CharacterBody2D

@export var Velocidad = 0
@export var Objetivo : CharacterBody2D

@export var Protones  = 0
@export var Neutrones = 0
@export var Electrones = Protones

func _process(_delta):
	
	velocity = global_position.direction_to(Objetivo.position) * Velocidad
	move_and_slide()
