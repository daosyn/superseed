extends Area2D

signal hit()

@export var speed = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.play()

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	if velocity.x != 0:
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.rotation_degrees = 90 if velocity.x > 0 else -90
	elif velocity.y != 0:
		$AnimatedSprite2D.rotation_degrees = false
		$AnimatedSprite2D.flip_v = velocity.y > 0
