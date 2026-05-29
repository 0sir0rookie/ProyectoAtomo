extends GPUParticles2D

var UltimaCantidad

func _process(_delta):
	
	if get_parent().Electrones < 1:
		amount = 1
		return
	
	var CantidadElec = floor(get_parent().Electrones / 2)
	
	if CantidadElec == UltimaCantidad:
		return
	
	UltimaCantidad = CantidadElec
	
	amount = CantidadElec
	
