extends Sprite2D

var Atlas
var UltimoProtones = 0

func _ready():
	
	Atlas = texture as AtlasTexture

func _process(_delta):
	 
	var NProtones = get_parent().Protones
	
	if NProtones == UltimoProtones:
		return
	
	UltimoProtones = NProtones
	
	if NProtones > 118:
		NProtones = 118
	
	var Columna = (NProtones - 1) % 11
	var Fila = floor((NProtones - 1) / 11)
	
	Atlas.region = Rect2(Columna * 130,Fila * 130,130,130)
