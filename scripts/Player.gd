extends CharacterBody2D

const inputs = {
	"move_right": Vector2.RIGHT,
	"move_left": Vector2.LEFT,
	"move_down": Vector2.DOWN,
	"move_up": Vector2.UP
}

var grid_size = 32
var screen_size
var raycast

func _ready():
	screen_size = get_viewport_rect().size
	raycast = $RayCast2D
	$AnimatedSprite2D.play()

func _unhandled_input(event):
	for action in inputs.keys():
		if event.is_action_pressed(action):
			move(action)
	
	#if velocity.x != 0:
		#$AnimatedSprite2D.flip_v = false
		#$AnimatedSprite2D.rotation_degrees = 90 if velocity.x > 0 else -90
	#elif velocity.y != 0:
		#$AnimatedSprite2D.rotation_degrees = false
		#$AnimatedSprite2D.flip_v = velocity.y > 0

func move(action):
	var destination = inputs[action] * grid_size
	#raycast.cast_to = destination
	#raycast.force_raycast_update()
	#if not raycast.is_colliding():
	position += destination
	position.x = clamp(position.x, 272, 368)
	position.y = clamp(position.y, 176, 272)
