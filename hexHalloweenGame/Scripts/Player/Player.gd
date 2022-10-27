extends KinematicBody2D

var timeline = ""

var butlerDialogged = false #Has Kulrik talked with the butler

var arachnaDialogged = false #Has Kulrik talked with Claustro

var beginnerDialogged = false #Has Kulrik talked with Himself in the beginning

export (int) var sanity = 100

var demonlord = null #Not actually the demonlord but the demonstatue

var canMove = true

func _ready():
	pass
		

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
	
	if sanity <=0:
		get_tree().quit()
	
	motion = Vector2.ZERO
	if canMove == true:
		_movement()
	
	if demonlord != null:
		if Input.is_action_just_pressed("ui_accept") and demonlord.lord == "Arachna":
			get_tree().change_scene("res://Scenes/Levels/Arachnophobia.tscn")
	
	
	if beginnerDialogged== false:
		canMove = false
		beginnerDialogged = true
		timeline = "Beginning"
		var new_dialog = Dialogic.start(timeline)
		add_child(new_dialog)
		
		canMove = true
	
	$sanityLabel.text = "Sanity: "+str(sanity)


func _on_Area2D_area_entered(area):
	
	
	if area.is_in_group("butler") and butlerDialogged == false:
		canMove = false
		timeline = "Butler"
		var new_dialog = Dialogic.start(timeline)
		add_child(new_dialog)
		butlerDialogged = true
		canMove = true


func _on_Area2D_body_entered(body):
	
	if body.is_in_group("arachna"):
		sanity -= 1
		
	if body.is_in_group("demonStatue"):
		
	
		if body.lord == "Arachna":
			
			demonlord = body
	
	if body.is_in_group("arachna") and arachnaDialogged == false:
		canMove = false
		
		timeline = "Arachna"
		var new_dialog = Dialogic.start(timeline)
		add_child(new_dialog)
		arachnaDialogged = true
		canMove=true

	

func _on_sanityDecrement_timeout():
	sanity -= 5
