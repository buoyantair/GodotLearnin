extends Sprite

var linear_speed = 100
var linear_direction = 0
var angular_speed = PI
var angular_direction = 0

func _unhandled_input(event):
	if Input.is_action_pressed("ui_left"):
		angular_direction = -1
	elif Input.is_action_pressed("ui_right"):
		angular_direction = 1
	else:
		angular_direction = 0
	
	if Input.is_action_pressed("ui_up"):
		linear_direction = 1
	elif Input.is_action_pressed("ui_down"):
		linear_direction = -1
	else:
		linear_direction = 0

func _process(delta):
	rotation += angular_speed * angular_direction * delta

	var linear_velocity = Vector2.ZERO
	linear_velocity = Vector2.UP.rotated(rotation) * linear_speed

	position += linear_velocity * linear_direction * delta
