extends KinematicBody2D

var player = null

var motion = Vector2()

export (int) var speed = 100

func _on_Spotlight_body_entered(body):
	if body.is_in_group("player"):
		player = body
		

func _physics_process(delta):
	
	motion = Vector2.ZERO
	
	if player and player.arachnaDialogged == true:
		look_at(player.position)
		motion = position.direction_to(player.position) * speed
		
	
	motion = move_and_slide(motion)
