extends CharacterBody2D
@export var direction = 1
const SPEED = 30.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():	
	hide()
	$CollisionShape2D.disabled = true
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	velocity.x = SPEED * direction
	$AnimatedSprite2D.flip_h = velocity.x > 0;
	$AnimatedSprite2D.play("tedrosWalkLeft")
	move_and_slide()	

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func walkToward(leftOrRight):
	direction = leftOrRight
