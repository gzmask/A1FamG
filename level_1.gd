extends Node

func newGame():
	$Maia.start($p1StartPos.position)
	$Ysa.start($p2StartPos.position)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	newGame()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
