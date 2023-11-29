extends Camera2D
const MIN_ZOOM = 0.5
const MAX_ZOOM = 2.0 #This is the starting zoom
var Maia
var Ysa

func _ready():
	Maia = $"../Maia"
	Ysa = $"../Ysa"
	
func _process(delta):
	var zoom_factorX = abs(Maia.position.x-Ysa.position.x)/1920
	var zoom_factorY = abs(Maia.position.y-Ysa.position.y)/1080
	var zoom_factor = clamp(MAX_ZOOM-max(zoom_factorX, zoom_factorY), MIN_ZOOM, MAX_ZOOM)
	if zoom_factor > MIN_ZOOM:
		position = (Maia.position + Ysa.position) * 0.5
		zoom = Vector2(zoom_factor, zoom_factor)
	elif Maia.position.y > Ysa.position.y:
		position = Ysa.position
		zoom = Vector2(MAX_ZOOM/2, MAX_ZOOM/2)
	else:
		position = Maia.position
		zoom = Vector2(MAX_ZOOM/2, MAX_ZOOM/2)

