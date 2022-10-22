extends KinematicBody2D

var timeline = ""

export (int) var sanity = 100

func _ready():
	timeline = "Beginning"
	var new_dialog = Dialogic.start(timeline)
	add_child(new_dialog)
	sanity -= 10

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
	
	
	if timeline == "Claustro":
		var new_dialog = Dialogic.start(timeline)
		add_child(new_dialog)




