extends Sprite2D

func _process(_delta):
	position.x = get_parent().size.x/2
	position.y = get_parent().size.y + 3
