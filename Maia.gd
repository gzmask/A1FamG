extends CharacterBody2D
@export var speed = 400 # How fast the player will move (pixels/sec).
var JUMP_POWER = -5000.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jumpingTimer = 0.0
const JUMP_TIME = 0.5 #in seconds
# Called when the node enters the scene tree for the first time.
func _ready():	
	hide()
	$CollisionShape2D.disabled = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("p1MoveRight"):
		velocity.x += 1
	if Input.is_action_pressed("p1MoveLeft"):
		velocity.x -= 1
	velocity = velocity.normalized() * speed
	if is_on_floor() && Input.is_action_just_pressed("p1Jump"):
		jumpingTimer = JUMP_TIME;
	if jumpingTimer > 0:
		velocity.y = lerp(JUMP_POWER, 0.0, 1-jumpingTimer)
		jumpingTimer -= delta

	$AnimatedSprite2D.flip_h = velocity.x < 0;
	if velocity.x > 0:
		if jumpingTimer > 0:
			$AnimatedSprite2D.play("maiaJump")
		else:
			$AnimatedSprite2D.play("maiaWalkRight")
	elif velocity.x < 0:
		if jumpingTimer > 0:
			$AnimatedSprite2D.play("maiaJump")
		else:
			$AnimatedSprite2D.play("maiaWalkRight")
	else:
		if not is_on_floor():
			$AnimatedSprite2D.play("maiaJump")
		else:
			$AnimatedSprite2D.play("maiaIdle")
	if not is_on_floor():
		velocity.y += gravity
	if not abs((position.x + (velocity * delta).x) - $"../Ysa".position.x) <= 800:
		velocity.x = 0
	velocity.y = clamp(velocity.y, JUMP_POWER, gravity*10)	
	move_and_slide()

func start(pos):
	position = pos
	show()
	$AnimatedSprite2D.play("maiaIdle")
	$CollisionShape2D.disabled = false
