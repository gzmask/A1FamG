extends Node

func newGame():
	$Maia.start($p1StartPos.position)
	$Ysa.start($p2StartPos.position)
	$Tedros.start($TedrosStartPos.position)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	newGame()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	pass

func _physics_process(delta):
	if $Tedros.position.x > $Maia.position.x:
		$Tedros.walkToward(-1)
	else:
		$Tedros.walkToward(1)
		
	if $Tedros.position.distance_to($Maia.position) > 500:
		$Tedros.position = $Maia.position
