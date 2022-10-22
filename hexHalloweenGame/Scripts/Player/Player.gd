extends KinematicBody2D


var motion = Vector2()

export (int) var speed = 500

func _movement():
	if Input.is_action_pressed("ui_up"):
		motion.y -= 10
		
		
	if Input.is_action_pressed("ui_down"):
		motion.y += 10
		
		
	if Input.is_action_pressed("ui_left"):
		motion.x -= 10
		
		
	if Input.is_action_pressed("ui_right"):
		motion.x += 10
		
	motion = motion.normalized()
	motion = move_and_slide(motion * speed)

func _physics_process(delta):
	motion = Vector2.ZERO
	_movement()
