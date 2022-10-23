extends KinematicBody2D

var timeline = ""

var butlerDialogged = false #Has Kulrik talked with the butler

var claustroDialogged = false #Has Kulrik talked with Claustro

var beginnerDialogged = false #Has Kulrik talked with Himself in the beginning

export (int) var sanity = 100

func _ready():
	if beginnerDialogged== false:
		timeline = "Beginning"
		var new_dialog = Dialogic.start(timeline)
		add_child(new_dialog)
		sanity -= 10
		beginnerDialogged = true

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
	







func _on_Area2D_area_entered(area):
	if area.is_in_group("claustro") and claustroDialogged == false:
		sanity -= 20
		timeline = "Claustro"
		var new_dialog = Dialogic.start(timeline)
		add_child(new_dialog)
		claustroDialogged = true
	
	if area.is_in_group("butler") and butlerDialogged == false:
		timeline = "Butler"
		var new_dialog = Dialogic.start(timeline)
		add_child(new_dialog)
		butlerDialogged = true
	


func _on_Area2D_body_entered(body):
	if body.is_in_group("demonStatue"):
		if body.lord == "Claustro":
			print(body.lord)
