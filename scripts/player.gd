extends KinematicBody2D

var input_states = preload("res://scripts/input_states.gd")

var player_speed = 32

var speed = Vector2(0, 0)
var curr_pos = Vector2(0, 0)

var btn_right = input_states.new("ui_right")
var btn_left = input_states.new("ui_left")
var btn_up = input_states.new("ui_up")
var btn_down = input_states.new("ui_down")

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	curr_pos = get_pos() #176, 272
	if btn_right.check() == 1 && curr_pos.x < 272:
		speed.x = player_speed
	elif btn_left.check() == 1 && curr_pos.x > 176:
		speed.x = -player_speed
	elif btn_up.check() == 1 && curr_pos.y > 176:
		speed.y = -player_speed
	elif btn_down.check() == 1 && curr_pos.y < 272:
		speed.y = player_speed
	else:
		speed = Vector2(0, 0)

	move(speed)
	pass
