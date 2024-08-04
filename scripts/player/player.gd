extends KinematicBody2D

const GRAVITY :=10
var jumpForce := 400
var velocity := Vector2.ZERO
var speed := 200
var weight:= 0.5

onready var animation:= $animation as AnimatedSprite
onready var screenSize:= get_viewport_rect().size

#movimento
func move(delta):
	velocity.y += GRAVITY
	var inputDirection = Input.get_axis("ui_left","ui_right")
	var collision = move_and_collide(velocity*delta)
	
	#direção
	if inputDirection !=0:
		velocity.x = lerp(velocity.x, inputDirection * speed, weight)
		animation.scale.x = -inputDirection
	else:
		velocity.x = lerp(velocity.x, 0, weight)
		
	#Animação
	if velocity.y > 0:
		animation.play("fall")
	else:
		animation.play("idle")
		
	#colisão e pulo
	if collision:
		velocity.y = -jumpForce * collision.collider.jumpForce
		if collision.collider.has_method("response"):
			collision.collider.response()
		
func _physics_process(delta: float) ->void:
	move(delta)
	position.x = wrapf(position.x , 0, screenSize.x)
	
